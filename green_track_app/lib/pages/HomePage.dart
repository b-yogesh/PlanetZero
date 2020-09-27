import 'package:flutter/material.dart';
import 'package:green_track_app/pages/DonatePage.dart';
import 'package:green_track_app/widgets/emojiBadge.dart';
import 'package:green_track_app/widgets/infoBadge.dart';
import 'package:green_track_app/widgets/colorSplitText.dart';
import 'package:green_track_app/widgets/offsetButton.dart';
import 'package:green_track_app/widgets/swipeUpIndicator.dart';

class HomePage extends StatefulWidget {
  final double co2Amount = 5.32;
  final int treeAmount = 7;
  final int percentageBetterThanAverage = 30;

  final int co2Level = 0; //0-2

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {

  
    AnimationController _controller;
    Animation<double> _animation;

    AnimationController _fadeController;
  
    initState() {
      super.initState();
      _controller = AnimationController(
          duration: const Duration(milliseconds: 100000),
          vsync: this,
          lowerBound: 0,
          upperBound: 1,

      );
      _animation = CurvedAnimation(parent: _controller, curve: Curves.linear);
  
      _controller.forward();

      _animation.addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.repeat();
        }
      });

      _fadeController = AnimationController(
          duration: const Duration(milliseconds: 1000),
          vsync: this,
          lowerBound: 0,
          upperBound: 1,

      );
      _fadeController.forward();
    }
  
    @override
    dispose() {
      _controller.dispose();
      super.dispose();
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Transform.translate(
            offset: Offset(0,MediaQuery.of(context).size.height/2),
            child: OverflowBox(
              maxHeight: MediaQuery.of(context).size.height*2,
              maxWidth: MediaQuery.of(context).size.height*2,
              child: FadeTransition(
                opacity: Tween<double>(
                  begin: 0.0,
                  end: 1.0,
                ).animate(_fadeController),
                child: RotationTransition(
                  turns: _animation,
                  child: Image(
                    image: widget.co2Level == 0 ? AssetImage("assets/backgrounds/state1.png") :
                            widget.co2Level == 1 ? AssetImage("assets/backgrounds/state2.png") :
                                            AssetImage("assets/backgrounds/state3.png"),
                    height: MediaQuery.of(context).size.height*2,
                    fit: BoxFit.none,
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height*0.25,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    const Color(0xFF003333),
                  ],
                ),
              ),
            ),
          ),
          Column(
            children: [
              Container(height:MediaQuery.of(context).size.height*0.2),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InfoBadge(
                    wholePart: widget.co2Amount.truncate(),
                    decimalPart: int.parse(widget.co2Amount.toString().split(".")[1]),
                    useDecimal: true,
                    suffix: "kg CO₂",
                  ),
                  InfoBadge(
                    wholePart: widget.treeAmount,
                    useDecimal: false,
                    suffix: "Trees",
                  ),
                ],
              ),
              Container(height: 60),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  EmojiBadge(
                    mainText: "2.3km",
                    suffix: "kg CO₂",
                    level: 0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 55),
                    child: EmojiBadge(
                      mainText: "5.4km",
                      suffix: "kg CO₂",
                      level: 1,
                    ),
                  ),
                  EmojiBadge(
                    mainText: "3.2km",
                    suffix: "kg CO₂",
                    level: 2,
                  ),
                ],
              ),
              Container(height: 40),
              ColorSplitText(
                color: Colors.red,
                size: 13,
                prefixText: "Your footprint is ",
                coloredText: widget.percentageBetterThanAverage.toString() + "% better",
                suffixText: " than the average",
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(),
                    OffsetButton(
                      callback: DonatePage.open,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom:20.0),
                      child: SwipeUpIndicator(),
                    ),
                  ],
                ),
              )
              
            ],
          ),
        ],
      ),
    );
  }
}
