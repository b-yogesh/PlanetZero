import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';



class OffsettingPost extends StatelessWidget {

  final List<String> bulletPoints;
  final String name;
  final String learnMoreUrl;
  final String offsetUrl;
  final String imageUrl;

  OffsettingPost({this.bulletPoints, this.name, this.learnMoreUrl, this.offsetUrl, this.imageUrl});

  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:20.0, vertical: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Stack(
                  children: [
                    SizedBox(
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                      ),
                      width: MediaQuery.of(context).size.width - 40,
                      height: (MediaQuery.of(context).size.width - 40)*0.6,
                    ),
                    SizedBox(
                      child: Opacity(
                        opacity: 0.75,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Colors.black,Colors.transparent],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              )
                            ),
                          ),
                      ),
                      width: MediaQuery.of(context).size.width - 40,
                      height: (MediaQuery.of(context).size.width - 40)*0.6,
                    ),
                    Positioned.fill(
                      child: SizedBox(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              name,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Nunito Sans",
                                fontWeight: FontWeight.w900,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                        width: MediaQuery.of(context).size.width - 40,
                        height: (MediaQuery.of(context).size.width - 40)*0.6,
                      ),
                    ),
                    
                  ],
                ),
              ),
              Container(height:20),
              for (var point in bulletPoints) 
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:20.0, vertical: 2),
                  child: Text(
                    "• " + point,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w700,
                      fontSize: 13,
                    ),
                  ),
                ),
              Container(height:10),
              GestureDetector(
                onTap: () async {
                  await _launchURL(learnMoreUrl);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal:20.0, vertical:2),
                  child: Text(
                    "Learn More",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w900,
                      fontSize: 13,
                      decoration: TextDecoration.underline
                    ),
                  ),
                ),
              ),
              Container(height:10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:20.0,vertical: 20),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width - 80,
                  child: FlatButton(
                    onPressed: () async {
                      await _launchURL(offsetUrl);
                    },
                    padding: EdgeInsets.all(0),
                    color: Color(0xff26FF97),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50))
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical:17.0),
                      child: Text(
                        "Offset your emissions",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Montserrat", 
                          fontWeight: FontWeight.w900,
                          fontSize: 14,
                        ),
                      ),
                    )
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}