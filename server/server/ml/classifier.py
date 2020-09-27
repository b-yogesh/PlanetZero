import pickle
import pandas as pd
import pyproj
import os
import datetime as dt
import numpy as np

geod = pyproj.Geod(ellps='WGS84')
headers_trajectory = ['lat', 'long', 'null', 'altitude','timestamp_float', 'date', 'time']

class RandomForestClassifier:

    def __init__(self):
        # self.model = pickle.load(path+ "rf_classifier.sav")
        pass


    def calculate_distance(self, long1, lat1, long2, lat2):
        if lat1 == lat2 and long1 == long2:
            return 0
        if False in np.isfinite([long1, long2, lat1, lat2]):
            return np.nan
        if lat1 < -90 or lat1 > 90 or lat2 < -90 or lat2 > 90:
            #raise ValueError('The range of latitudes seems to be invalid.')
            return np.nan
        if long1 < -180 or long1 > 180 or long2 < -180 or long2 > 180:
            return np.nan
            #raise ValueError('The range of longitudes seems to be invalid.')
        angle1,angle2,distance = geod.inv(long1, lat1, long2, lat2)
        return distance


    def calculate_velocity(self, distance, timedelta):
        if timedelta.total_seconds() == 0: return np.nan
        return distance / timedelta.total_seconds()


    def calculate_acceleration(self, velocity, velocity_next_position, timedelta):
        delta_v = velocity_next_position - velocity
        if timedelta.total_seconds() == 0: return np.nan
        return delta_v / timedelta.total_seconds()


    def load_trajectory_df(self, input_dataframe):
        df = input_dataframe
        df['datetime'] = df.apply(lambda z: dt.datetime.strptime(z.date + ' ' + z.time, '%Y-%m-%d %H:%M:%S'), axis=1)
        df['datetime_next_position'] = df['datetime'].shift(-1)
        df['timedelta'] = df.apply(lambda z: z.datetime_next_position - z.datetime, axis=1)
        df = df.drop(['datetime_next_position'], axis=1)
        # df = df.drop(['null'], axis=1)
        
        df['long_next_position'] = df['long'].shift(-1)
        df['lat_next_position'] = df['lat'].shift(-1)
        df['distance'] = df.apply(lambda z: self.calculate_distance(z.long, z.lat, z.long_next_position, z.lat_next_position), axis=1)
        df = df.drop(['long_next_position', 'lat_next_position'], axis=1)
        
        df['velocity'] = df.apply(lambda z:  self.calculate_velocity(z.distance, z.timedelta), axis=1)
        df['velocity_next_position'] = df['velocity'].shift(-1)
        df['acceleration'] = df.apply(lambda z:  self.calculate_acceleration(z.velocity, z.velocity_next_position, z.timedelta), axis=1)
        df = df.drop(['velocity_next_position'], axis=1)
            
        self.calculate_agg_features(df)
        return df


    def calculate_agg_features(self, df):
        v_ave = np.nanmean(df['velocity'].values)
        v_med = np.nanmedian(df['velocity'].values)
        v_max = np.nanmax(df['velocity'].values)
        a_ave = np.nanmean(df['acceleration'].values)
        a_med = np.nanmedian(df['acceleration'].values)
        a_max = np.nanmax(df['acceleration'].values)
        df.loc[:, 'v_ave'] = v_ave
        df.loc[:, 'v_med'] = v_med
        df.loc[:, 'v_max'] = v_max
        df.loc[:, 'a_ave'] = a_ave
        df.loc[:, 'a_med'] = a_med
        df.loc[:, 'a_max'] = a_max


    def preprocessing(self, input_data):
        input_data = pd.DataFrame(input_data)
        input_data = self.load_trajectory_df(input_data)
        # input_data.fillna(self.values_fill_missing)
        input_data = input_data.dropna(subset=['v_ave','v_med','v_max',  'a_ave', 'a_med', 'a_max']) 
        return input_data


    def predict(self, input_data):
        X_colnames = ['v_ave','v_med','v_max', 'a_ave', 'a_med', 'a_max']
        input_data = input_data[X_colnames].values
        print("predict", input_data.shape)
        print(input_data)
        return self.model.predict_proba(input_data)


    def postprocessing(self, prediction):
        return {"prediction": prediction, "status": "OK"}


    def compute_prediction(self, input_data):
        try:
            input_data = self.preprocessing(input_data)
            prediction = self.predict(input_data)[0]  # only one sample
            prediction = self.postprocessing(prediction)
        except Exception as e:
            return {"status": "Error1", "message": str(e)}

        return prediction


#test
# data = pd.read_csv("../test.csv")
# data = data.iloc[:, 0:5]
# classifier = RandomForestClassifier()
# classifier.compute_prediction(data)