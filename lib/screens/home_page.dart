import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutterappearth/data/carousel_data_no_image.dart';
import 'package:flutterappearth/data/task_data.dart';
import 'package:flutterappearth/widgets/carousel_item_no_image.dart';
import 'package:flutterappearth/widgets/list_item.dart';


class MyPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black54,
        body: Stack(
          children: [
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
              margin: EdgeInsets.fromLTRB(0, 100, 0, 0),
                child: Stack(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Expanded(
                            flex: 5,
                            child: Image.asset(
                              "assets/images/bgneon.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Container(),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      top: 65,
                      left: 60,
                      child: Text(
                        "Tasks Details",
                        style: TextStyle(
                            fontSize: 30,
                            fontFamily: 'RadioSpaceBold',
                            color: Colors.white),
                      ),
                    ),

                    Positioned(
                      top: 120,
                      left: 10,
                      child: Container(
                        height: 450,
                        width: 400,
                        margin: EdgeInsets.symmetric(vertical: 0,horizontal: 0),
                        child: ListView.builder(
                          itemBuilder: (ctx, i) => ItemList(
                            task: taskList[i],
                          ),
                          itemCount: taskList.length,
                          padding: EdgeInsets.symmetric(vertical: 0,horizontal: 0),
                        ),
                      ),
                    ),
                  ],
                )),
            Positioned(
              bottom: 10,
              left: 10,
              child: Container(
                  width: 400,
                  height: 200,
                margin: EdgeInsets.fromLTRB(0, 100, 0, 0),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 5,
                        left: 150,
                        child: Text(
                          "Thanks",
                          style: TextStyle(
                              fontSize: 30,
                              fontFamily: 'RadioSpaceBold',
                              color: Colors.white),
                        ),
                      ),
                      Center(
                        child: Container(
                          height: 100,
                          child: Swiper(
                            itemBuilder: (BuildContext context, int index) {
                              return CarouselItem(
                                carousel: dataList[index],
                              );
                            },
                            autoplay: true,
                            itemCount: dataList.length,
                            containerHeight: MediaQuery.of(context).size.height * 1.5,
                            containerWidth: MediaQuery.of(context).size.width * 0.9,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 20,
                        child: Image.asset(
                          "assets/Group 13.png",
                          width: 400,
                          height: 180,
                          fit: BoxFit.fill,
                        ),
                      ),
                      ],
                  )),
            ),
          ],
        ));
  }
}
