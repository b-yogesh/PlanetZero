import 'package:flutter/material.dart';
import 'package:green_track_app/widgets/offsetingPost.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

class DonatePage extends StatefulWidget {
  @override
  _DonatePageState createState() => _DonatePageState();

  static void open(context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DonatePage()),
    );
  }
}

class _DonatePageState extends State<DonatePage> {
  initState() {
    super.initState();
    FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
  }

  @override
  dispose() {
    super.dispose();
    FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, right: 5),
                    child: IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
              OffsettingPost(
                bulletPoints: [
                  "Halting and reversing land degradation",
                  "Employment, including local people",
                  "Creating new industry in rural areas",
                  "Large-scale habitat for over 450 native species"
                ],
                name: "Yarra Yarra Biodiversity Project",
                imageUrl: "https://www.goldstandard.org/sites/default/files/styles/1140x400/public/yarra_yarra_project_splendid_fairy-wren_male_hvrem5northside_111014_3.jpg?itok=L-_X8ruY",
                learnMoreUrl: "https://www.goldstandard.org/projects/yarra-yarra-biodiversity-project",
                offsetUrl: "https://www.goldstandard.org/projects/yarra-yarra-biodiversity-project",
              ),
              OffsettingPost(
                bulletPoints: [
                  "15.140 smoke-free kitchens",
                  "90.840 direct beneficiaries",
                  "333.500 tCO2 reduced",
                  "202.000 ton of wood saved"
                ],
                name: "Kenya Biogas Programme",
                imageUrl: "https://www.goldstandard.org/sites/default/files/styles/1140x400/public/10biogas_nakuru.jpg?itok=lZiqCOBj",
                learnMoreUrl: "https://www.goldstandard.org/projects/kenya-biogas-programme",
                offsetUrl: "https://www.goldstandard.org/projects/kenya-biogas-programme",
              ),
              OffsettingPost(
                bulletPoints: [
                  "Biodiversity conservation",
                  "Reintroduce wild animals that are illegally removed",
                  "Improved working conditions to employees",
                  "Avoidance of deforestation"
                ],
                name: "Ceará Renewable Energy Bundled Project",
                imageUrl: "https://www.goldstandard.org/sites/default/files/styles/1140x400/public/arara.jpg?itok=vQ_FPCHR",
                learnMoreUrl: "https://www.goldstandard.org/projects/ceara-renewable-energy-bundled-project",
                offsetUrl: "https://www.goldstandard.org/projects/ceara-renewable-energy-bundled-project",
              ),
              Container(height: 5)
            ],
          ),
        ),
      ),
    );
  }
}
