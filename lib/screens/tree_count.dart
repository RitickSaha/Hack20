import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutterappearth/screens/leaderboard.dart';
import 'package:mccounting_text/mccounting_text.dart';

class TreeCount extends StatefulWidget {
  @override
  _TreeCountState createState() => _TreeCountState();
}

class _TreeCountState extends State<TreeCount> {
  bool open = false;

  @override
  void initState() {
    setState(() {
      Timer(Duration(milliseconds: 0), () {
        setState(() {
          open = true;
        });
      });
      //open = true;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          ShaderMask(
            shaderCallback: (Rect bounds) {
              return LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.redAccent, Colors.transparent],
                stops: [0.5, 0.9],
              ).createShader(bounds);
            },
            blendMode: BlendMode.dstIn,
            child: Image.asset("assets/Mask.png"),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.white30],
                  stops: [0.5, 0.9],
                ),
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white70,
                    blurRadius: 200.0,
                    spreadRadius: -12,
                    offset: Offset(
                      0.0,
                      3.0,
                    ),
                  ),
                ]),
            child: Text(
              "Planetary Saviors",
              style: TextStyle(fontFamily: "Pacifico", fontSize: 30.0),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 100),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Total Trees planted all Of you:",
                          style: TextStyle(
                              fontFamily: "Rajdhani",
                              color: Colors.white,
                              fontSize: 35),
                        ),
                        Text(
                          "according to TeamTrees",
                          style: TextStyle(
                              fontFamily: "Rajdhani",
                              color: Colors.white,
                              fontSize: 20),
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          child: Center(
                            child: McCountingText(
                              begin: 0,
                              end: 22093018,
                              style: TextStyle(
                                  fontFamily: "Rajdhani",
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 80),
                              duration: Duration(seconds: 3),
                              curve: Curves.easeInToLinear,
                            ),
                          ),
                        ),
                        Positioned(
                            right: 50,
                            bottom: 20,
                            child: GestureDetector(
                              onTap: () => {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => SecondRoute()),
                                )
                              },
                              child: Stack(
                                children: <Widget>[
                                  SvgPicture.asset(
                                    'assets/aBlue.svg',
                                    height: 65,
                                  ),
                                  Positioned(
                                    top: 15,
                                    left: 30,
                                    child: Text(
                                      "See  Detailed Stats",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ),
                                  Positioned(
                                    top: 45,
                                    left: 20,
                                    child: Text(
                                      "Green Is the new Black!",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  )
                                ],
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
                AnimatedContainer(
                  curve: Curves.fastOutSlowIn,
                  duration: Duration(milliseconds: 2000),
                  height: open ? MediaQuery.of(context).size.height * 0.4 : 0,
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.1),
                  width: double.infinity,
                  child: Image.asset(
                    "assets/trees.png",
                    fit: BoxFit.fitHeight,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
