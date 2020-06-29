import 'dart:async';
import 'dart:ui' as ui;
import 'dart:math' as math;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mccounting_text/mccounting_text.dart';
import 'home_page.dart';

class SecondRoute extends StatelessWidget {
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
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFe61c4e).withAlpha(20),
                    blurRadius: 200.0,
                    spreadRadius: 0.0,
                    offset: Offset(
                      0.0,
                      3.0,
                    ),
                  ),
                ]),
          ),
          Positioned(
            top: 140,
            left: 30,
            child: Stack(
              children: <Widget>[
                SvgPicture.asset(
                  'assets/Group 14.svg',
                  height: 65,
                ),
                Positioned(
                  top: 0,
                  left: 70,
                  child: Text(
                    "Saviour's Stats",
                    style: TextStyle(fontSize: 35,fontFamily: 'RadioSpaceBold'),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: 220,
            left: 30,
            child: Stack(
              children: <Widget>[
                SvgPicture.asset(
                  'assets/Group 18.svg',
                  height: 130,
                ),
                Positioned(
                  top: 40,
                  left: 15,
                  child: Text(
                    "Team Trees org is the largest Group\n of people, came together to save \nthe earth. By donating just 1\$\n anyone cant plant 1 tree",
                    style: TextStyle(fontSize: 20,fontFamily: 'RadioSpaceBold'),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: 360,
            left: 50,
            child: Text("Top Tree Donates",
              style: TextStyle(fontSize: 40,fontFamily: 'RadioSpaceBold'),
              textAlign: TextAlign.center,
            ),
          ),
          Positioned(
            top: 420,
            left: 30,
            child: Stack(
              children: <Widget>[
                SvgPicture.asset(
                  'assets/Group 16.svg',
                  height: 100,
                ),
                Positioned(
                  top: 14,
                  left: 90,
                  child: Text(
                    "#TeamTrees",
                    style: TextStyle(fontSize: 30,fontFamily: 'RadioSpaceBold',color: Colors.cyanAccent),
                    textAlign: TextAlign.center,
                  ),
                ),
                Positioned(
                  top: 65,
                  left: 135,
                  child: McCountingText(
                    begin: 0,
                    end: 3832909.toDouble(),
                    style: TextStyle(fontSize: 30,fontFamily: 'RadioSpaceBold',color: Colors.white),
                    duration: Duration(seconds: 3),
                    curve: Curves.decelerate,
                  ),
                ),
                Positioned(
                  top: 65,
                  left: 115,
                  child: Text(
                    "\$",
                    style: TextStyle(fontSize: 30,fontFamily: 'RadioSpaceBold',color: Colors.green),
                    ),
                )
              ],
            ),
          ),
          Positioned(
            top: 530,
            left: 30,
            child: Stack(
              children: <Widget>[
                SvgPicture.asset(
                  'assets/Group 16.svg',
                  height: 100,
                ),
                Positioned(
                  top: 14,
                  left: 90,
                  child: Text(
                    "Mr. Beast ",
                    style: TextStyle(fontSize: 30,fontFamily: 'RadioSpaceBold',color: Colors.greenAccent),
                    textAlign: TextAlign.center,
                  ),
                ),
                Positioned(
                  top: 65,
                  left: 135,
                  child: McCountingText(
                    begin: 0,
                    end: 3232909.toDouble(),
                    style: TextStyle(fontSize: 30,fontFamily: 'RadioSpaceBold',color: Colors.white),
                    duration: Duration(seconds: 3),
                    curve: Curves.decelerate,
                  ),
                ),
                Positioned(
                  top: 65,
                  left: 115,
                  child: Text(
                    "\$",
                    style: TextStyle(fontSize: 30,fontFamily: 'RadioSpaceBold',color: Colors.green),
                    ),
                )
              ],
            ),
          ),
          Positioned(
            top: 640,
            left: 30,
            child: Stack(
              children: <Widget>[
                SvgPicture.asset(
                  'assets/Group 16.svg',
                  height: 100,
                ),
                Positioned(
                  top: 14,
                  left: 90,
                  child:  Text(
                    "Amazon Inc ",
                    style: TextStyle(fontSize: 25,fontFamily: 'RadioSpaceBold',color: Colors.lightGreen),
                    textAlign: TextAlign.center,
                  ),
                ),
                Positioned(
                  top: 65,
                  left: 135,
                  child: McCountingText(
                    begin: 0,
                    end: 258220.toDouble(),
                    style: TextStyle(fontSize: 30,fontFamily: 'RadioSpaceBold',color: Colors.white),
                    duration: Duration(seconds: 3),
                    curve: Curves.decelerate,
                  ),
                ),
                Positioned(
                  top: 65,
                  left: 115,
                  child: Text(
                    "\$",
                    style: TextStyle(fontSize: 30,fontFamily: 'RadioSpaceBold',color: Colors.green),
                    ),
                )
              ],
            ),
          ),
          Positioned(
            top: 750,
            left: 30,
            child: Stack(
              children: <Widget>[
                SvgPicture.asset(
                  'assets/Group 16.svg',
                  height: 100,
                ),
                Positioned(
                  top: 14,
                  left: 90,
                  child:  Text(
                    "Reliance Inc ",
                    style: TextStyle(fontSize: 25,fontFamily: 'RadioSpaceBold',color: Colors.lightGreen),
                    textAlign: TextAlign.center,
                  ),
                ),
                Positioned(
                  top: 65,
                  left: 135,
                  child: McCountingText(
                    begin: 0,
                    end: 190089.toDouble(),
                    style: TextStyle(fontSize: 30,fontFamily: 'RadioSpaceBold',color: Colors.white),
                    duration: Duration(seconds: 3),
                    curve: Curves.decelerate,
                  ),
                ),
                Positioned(
                  top: 65,
                  left: 115,
                  child: Text(
                    "\$",
                    style: TextStyle(fontSize: 30,fontFamily: 'RadioSpaceBold',color: Colors.green),
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
