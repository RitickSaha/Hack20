import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterappearth/models/task_model.dart';

class ItemList extends StatefulWidget {
  final TaskModel task;
  ItemList({this.task});

  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;
  double opacity = 0.2;

  Animation<double> opacityAnimation;
  Animation<Offset> slideAnimation;
  AnimationController _controller;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    opacityAnimation = Tween<double>(begin: 0.0, end: 1).animate(
        CurvedAnimation(
            parent: _controller, curve: Curves.fastLinearToSlowEaseIn));
    slideAnimation = Tween<Offset>(begin: Offset(0, -2), end: Offset(0, 0))
        .animate(CurvedAnimation(
            parent: _controller, curve: Curves.fastLinearToSlowEaseIn));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              curve: Curves.fastOutSlowIn,
              margin: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              height: _isExpanded ? 270 : 90,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color(0xffDCE35B).withOpacity(opacity),
                    spreadRadius: 7,
                    blurRadius: 7,
                    offset: Offset(-1, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xffAEFF51), width: 1),
                  boxShadow: [
                    new BoxShadow(
                      color: Color(0xffDCE35B).withOpacity(0),
                    ),
                    const BoxShadow(
                      color: Colors.black12,
                      spreadRadius: -5.0,
                      blurRadius: 5.0,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        widget.task.title,
                        style: TextStyle(
                            color: Colors.white, fontFamily: "Poppins"),
                      ),
                      subtitle: Text(
                        "${widget.task.duration} days",
                        style: TextStyle(
                            color: Colors.white, fontFamily: "Poppins"),
                      ),
                      leading: CircleAvatar(
                        radius: 40,
                        backgroundColor:
                            Colors.lightGreenAccent.withOpacity(0.2),
                        child: ClipOval(
                          child: Image.network(widget.task.imageUrl),
                        ),
                      ),
                      trailing: FlatButton(
                        child: Container(
                          height: 40,
                          width: 40,
                          child: Image.asset(_isExpanded
                              ? "assets/images/expless.png"
                              : "assets/images/expmore.png"),
                        ),
                        onPressed: () {
                          setState(() {
                            if (_isExpanded) {
                              opacity = 0.2;
                              Timer(Duration(milliseconds: 300),
                                  () => _controller.reverse());
                            } else {
                              opacity = 0.3;
                              Timer(Duration(milliseconds: 300),
                                  () => _controller.forward());
                              // _controller.forward();
                            }
                            _isExpanded = !_isExpanded;
                          });
                        },
                      ),
                    ),
                    if (_isExpanded)
                      FadeTransition(
                        opacity: opacityAnimation,
                        child: SlideTransition(
                          position: slideAnimation,
                          child: SizeTransition(
                            sizeFactor: _controller,
                            child: Container(
                              height: _isExpanded ? 160 : 0,
                              margin: EdgeInsets.all(15),
                              child: Column(
                                children: [
                                  Text(
                                    widget.task.description,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Rajdhani"),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      FlatButton(
                                        child: Container(
                                          height: 40,
                                          width: 120,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/images/btngreen.png"),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "Accept",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: "Poppins"),
                                            ),
                                          ),
                                        ),
                                        onPressed: () {},
                                      ),
                                      FlatButton(
                                        child: Container(
                                          height: 40,
                                          width: 120,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/images/btnred.png"),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "Decline",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: "Poppins"),
                                            ),
                                          ),
                                        ),
                                        onPressed: () {},
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
