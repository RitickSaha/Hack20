import 'dart:async';
import 'dart:ui' as ui;
import 'dart:math' as math;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutterappearth/screens/carousel.dart';
import 'package:flutterappearth/screens/home_page.dart';
import 'package:flutterappearth/screens/tree_count.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Planet',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: MyHomePage(title: 'Planet'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  Scene _scene;
  Object _earth;
  bool checker1 = false, checker2 = false, checker3 = false, checker4 = false;
  Color ckred = Colors.red;
  double progress = 0;
  double progress2 = 0;
  Color ckgreen = Colors.green;
  bool add = true;
  double x = 0, y = 0, z = 0;
  Alignment _end = Alignment.centerLeft, _begin = Alignment.centerRight;
  AnimationController _controller;

  void generateSphereObject(Object parent, String name, double radius,
      bool backfaceCulling, String texturePath) async {
    final Mesh mesh =
        await generateSphereMesh(radius: radius, texturePath: texturePath);
    parent
        .add(Object(name: name, mesh: mesh, backfaceCulling: backfaceCulling));
    _scene.updateTexture();
  }

  void changes() {
    setState(() {
      x = 0;
      y = 500;
      _begin = Alignment.topCenter;
      _end = Alignment.bottomCenter;
    });
  }

  void _onSceneCreated(Scene scene) {
    _scene = scene;
    _scene.camera.position.z = 16;
    _earth = Object(name: 'earth', scale: Vector3(10.0, 10.0, 10.0));
    generateSphereObject(
        _earth, 'surface', 0.485, true, 'assets/4096_earth.jpg');
    _scene.world.add(_earth);
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: Duration(milliseconds: 30000), vsync: this)
      ..addListener(() {
        if (_earth != null) {
          _earth.rotation.y = _controller.value * 360;
          _earth.updateTransform();
          _scene.update();
        }
      })
      ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 1), () => changes());
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          ShaderMask(
            shaderCallback: (Rect bounds) {
              return LinearGradient(
                begin: _begin,
                end: _end,
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
          AnimatedContainer(
            duration: Duration(seconds: 3),
            transform: Matrix4.translationValues(x, y, z),
            child: ShaderMask(
              shaderCallback: (Rect bounds) {
                return LinearGradient(
                  begin: _begin,
                  end: _end,
                  colors: [Colors.redAccent, Colors.transparent],
                  stops: [0, 0.6],
                ).createShader(bounds);
              },
              blendMode: BlendMode.dstIn,
              child: Cube(onSceneCreated: _onSceneCreated),
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
          Container(
            margin: EdgeInsets.only(top: 170),
              height: 250,
              child: Carousel()
          ),
          Positioned(
              right: 50,
              bottom: 20,
              child: GestureDetector(
                onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FourthRoute()),
                  )
                },
                child: Stack(
                  children: <Widget>[
                    SvgPicture.asset(
                      'assets/a.svg',
                      height: 65,
                    ),
                    Positioned(
                      top: 15,
                      left: 30,
                      child: Text(
                        "See Your Earth",
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
          Positioned(
              bottom: 100,
              child: GestureDetector(
                child: Stack(
                  children: <Widget>[
                    Image.asset(
                      "assets/Group 6.png",
                      scale: 0.8,
                    ),
                    Positioned(
                      top: 75,
                      left: 75,
                      child: Text(
                        "Daily Tasks",
                        style: TextStyle(
                            fontSize: 30,
                            fontFamily: 'RadioSpaceBold',
                            color: Colors.white24),
                      ),
                    ),
                    Positioned(
                      top: 70,
                      left: 80,
                      child: Text(
                        "Daily Tasks",
                        style: TextStyle(
                            fontSize: 30, fontFamily: 'RadioSpaceBold'),
                      ),
                    ),
                    Positioned(
                        top: 110,
                        left: 65,
                        child: Container(
                          height: 60,
                          width: 300,
                          child: Stack(
                            children: [
                              Positioned(
                                bottom: 20,
                                left: 35,
                                child: Text(
                                  "Travel Via Car pool for 2 days",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                              Positioned(
                                top: 5,
                                left: 5,
                                child: ShaderMask(
                                  shaderCallback: (Rect bounds) {
                                    return LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.topRight,
                                      colors: [
                                        Colors.redAccent,
                                        Colors.transparent
                                      ],
                                      stops: [0.8, 1],
                                    ).createShader(bounds);
                                  },
                                  blendMode: BlendMode.dstIn,
                                  child: Image.asset(
                                    "assets/Path 14.png",
                                    scale: 0.8,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 20,
                                right: 0,
                                child: GestureDetector(
                                    child: Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          gradient: RadialGradient(
                                            colors: <Color>[
                                              Colors.black,
                                              checker1 ? ckgreen : Colors.red
                                            ],
                                          ),
                                        ),
                                        child: Center(
                                            child: Icon(checker1
                                                ? Icons.done
                                                : Icons.query_builder))),
                                    onTap: () => {
                                          debugPrint("test ok"),
                                          setState(() {
                                            if (checker1) {
                                              debugPrint("test true $progress");
                                              progress = progress - 0.3;
                                              if (progress < 0.2) {
                                                progress = 0;
                                              }
                                              checker1 = false;
                                            } else {
                                              progress = progress + 0.3;
                                              if (progress > 0.7) {
                                                progress = 1;
                                              }
                                              debugPrint("test true $progress");
                                              checker1 = true;
                                            }
                                          })
                                        }),
                              ),
                            ],
                          ),
                        )),
                    Positioned(
                        top: 160,
                        left: 65,
                        child: Container(
                          height: 60,
                          width: 300,
                          child: Stack(
                            children: [
                              Positioned(
                                bottom: 20,
                                left: 35,
                                child: Text(
                                  "Plant 1 tree nearby!",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                              Positioned(
                                top: 5,
                                left: 5,
                                child: ShaderMask(
                                  shaderCallback: (Rect bounds) {
                                    return LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.topRight,
                                      colors: [
                                        Colors.redAccent,
                                        Colors.transparent
                                      ],
                                      stops: [0.8, 1],
                                    ).createShader(bounds);
                                  },
                                  blendMode: BlendMode.dstIn,
                                  child: Image.asset(
                                    "assets/Path 14.png",
                                    scale: 0.8,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 20,
                                right: 0,
                                child: GestureDetector(
                                    child: Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          gradient: RadialGradient(
                                            colors: <Color>[
                                              Colors.black,
                                              checker2 ? ckgreen : Colors.red
                                            ],
                                          ),
                                        ),
                                        child: Center(
                                            child: Icon(checker2
                                                ? Icons.done
                                                : Icons.query_builder))),
                                    onTap: () => {
                                          debugPrint("test ok"),
                                          setState(() {
                                            if (checker2) {
                                              debugPrint("test true $progress");
                                              progress = progress - 0.3;
                                              if (progress < 0.2) {
                                                progress = 0;
                                              }
                                              checker2 = false;
                                            } else {
                                              progress = progress + 0.3;
                                              if (progress > 0.7) {
                                                progress = 1;
                                              }
                                              debugPrint("test true $progress");
                                              checker2 = true;
                                            }
                                          })
                                        }),
                              ),
                            ],
                          ),
                        )),
                    Positioned(
                        top: 210,
                        left: 65,
                        child: Container(
                          height: 60,
                          width: 300,
                          child: Stack(
                            children: [
                              Positioned(
                                bottom: 20,
                                left: 35,
                                child: Text(
                                  "Use E-pay to shop",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                              Positioned(
                                top: 5,
                                left: 5,
                                child: ShaderMask(
                                  shaderCallback: (Rect bounds) {
                                    return LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.topRight,
                                      colors: [
                                        Colors.redAccent,
                                        Colors.transparent
                                      ],
                                      stops: [0.8, 1],
                                    ).createShader(bounds);
                                  },
                                  blendMode: BlendMode.dstIn,
                                  child: Image.asset(
                                    "assets/Path 14.png",
                                    scale: 0.8,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 20,
                                right: 0,
                                child: GestureDetector(
                                    child: Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          gradient: RadialGradient(
                                            colors: <Color>[
                                              Colors.black,
                                              checker3 ? ckgreen : Colors.red
                                            ],
                                          ),
                                        ),
                                        child: Center(
                                            child: Icon(checker3
                                                ? Icons.done
                                                : Icons.query_builder))),
                                    onTap: () => {
                                          setState(() {
                                            if (checker3) {
                                              progress = progress - 0.3;
                                              if (progress < 0.2) {
                                                progress = 0;
                                              }
                                              checker3 = false;
                                              debugPrint("test true $progress");
                                            } else {
                                              debugPrint("test true $progress");
                                              progress = progress + 0.3;
                                              if (progress > 0.7) {
                                                progress = 1;
                                              }
                                              checker3 = true;
                                            }
                                          })
                                        }),
                              ),
                            ],
                          ),
                        )),
                    Positioned(
                      top: 310,
                      left: 85,
                      child: Text(
                        "Your progress",
                        style: TextStyle(
                            fontSize: 26, fontFamily: 'RadioSpaceBold'),
                      ),
                    ),
                    Positioned(
                      top: 350,
                      left: 88,
                      child: ShaderMask(
                        shaderCallback: (Rect bounds) {
                          return LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.topRight,
                            colors: [Colors.redAccent, Colors.transparent],
                            stops: [progress != 1 ? 0 : 1, progress],
                          ).createShader(bounds);
                        },
                        blendMode: BlendMode.dstIn,
                        child: Stack(
                          children: [
                            Positioned(
                              top: 2,
                              left: 5,
                              child: Image.asset(
                                "assets/Path 12.png",
                                scale: 0.8,
                              ),
                            ),
                            Positioned(
                              child: Image.asset(
                                "assets/Path 13.png",
                                scale: 0.8,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )),
          Positioned(
            child: Stack(
              children: <Widget>[
                Positioned(
                  bottom: -40,
                  left: -40,
                  child: Opacity(
                      opacity: add ? 0.0 : 1.0,
                      child: GestureDetector(
                        child: Container(
                          height: 200,
                          width: 200,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: RadialGradient(
                              colors: <Color>[
                                Colors.black,
                                Color(0xFF990033),
                              ],
                            ),
                          ),
                          child: Stack(children: [
                            Positioned(
                                right: 95,
                                top: 20,
                                child: GestureDetector(
                                  child: Container(
                                    child: Icon(Icons.home, size: 35),
                                  ),
                                )),
                            Positioned(
                                right: 35,
                                top: 45,
                                child: GestureDetector(
                                  onTap: () => {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => TreeCount()),
                                    )
                                  },
                                  child: Container(
                                    child: Icon(Icons.beach_access, size: 35),
                                  ),
                                )),
                            Positioned(
                                right: 20,
                                top: 100,
                                child: GestureDetector(
                                  onTap: () => {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ThirdRoute()),
                                    ),
                                  },
                                  child: Container(
                                    child: Icon(Icons.history, size: 35),
                                  ),
                                )),
                          ]),
                        ),
                      )),
                ),
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: GestureDetector(
                      child: Container(
                          height: 60,
                          width: 60,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: RadialGradient(
                              colors: <Color>[
                                Colors.black,
                                Color(0xFF990033),
                              ],
                            ),
                          ),
                          child: Icon(!add ? Icons.close : Icons.add)),
                      onTap: () => {
                            setState(() {
                              if (add) {
                                add = false;
                              } else {
                                add = true;
                              }
                            })
                          }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



class ThirdRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MyPage2(),
      ),
    );
  }
}

class FourthRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Scene _scene;
    Object _earth;
    double x = 0, y = 0, z = 0;
    Alignment _end = Alignment.centerLeft, _begin = Alignment.centerRight;

    void generateSphereObject(Object parent, String name, double radius,
        bool backfaceCulling, String texturePath) async {
      final Mesh mesh =
          await generateSphereMesh(radius: radius, texturePath: texturePath);
      parent.add(
          Object(name: name, mesh: mesh, backfaceCulling: backfaceCulling));
      _scene.updateTexture();
    }

    void _onSceneCreated(Scene scene) {
      _scene = scene;
      _scene.camera.position.z = 16;
      _earth = Object(name: 'earth', scale: Vector3(10.0, 10.0, 10.0));
      generateSphereObject(
          _earth, 'surface', 0.485, true, 'assets/4096_earth.jpg');
      _scene.world.add(_earth);
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          ShaderMask(
            shaderCallback: (Rect bounds) {
              return LinearGradient(
                begin: _begin,
                end: _end,
                colors: [Colors.redAccent, Colors.transparent],
                stops: [0.5, 0.9],
              ).createShader(bounds);
            },
            blendMode: BlendMode.dstIn,
            child: Image.asset("assets/Mask.png"),
          ),

          AnimatedContainer(
            duration: Duration(seconds: 3),
            transform: Matrix4.translationValues(x, y, z),
            child: Cube(onSceneCreated: _onSceneCreated),
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
          Positioned(
            bottom: 30,
            child: Container(
              child: Stack(
                children: [
                  SvgPicture.asset(
                    'assets/Group 12.svg',
                  ),
                  Positioned(
                      top: 100,
                      left: 40,
                      child: Text(
                        "Top 5 Saviors of the era:",
                        style: TextStyle(
                            fontFamily: 'RadioSpaceBold',
                            fontSize: 25,
                            color: Colors.amber),
                      )),
                  Positioned(
                      top: 130,
                      left: 40,
                      child: Text(
                        "1. Union of Concerned Scientists \n2. Natural Resources Defense Council \n3. Environmental Working Group\n4. Greenpeace Fund\n5. Friends of the Earth",
                        style: TextStyle(
                            fontFamily: 'RadioSpaceBold', fontSize: 18),
                      )),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

Future<Mesh> generateSphereMesh(
    {num radius = 1,
    int latSegments = 32,
    int lonSegments = 64,
    String texturePath}) async {
  int count = (latSegments + 1) * (lonSegments + 1);
  List<Vector3> vertices = List<Vector3>(count);
  List<Offset> texcoords = List<Offset>(count);
  List<Polygon> indices = List<Polygon>(latSegments * lonSegments * 2);

  int i = 0;
  for (int y = 0; y <= latSegments; ++y) {
    final double v = y / latSegments;
    final double sv = math.sin(v * math.pi);
    final double cv = math.cos(v * math.pi);
    for (int x = 0; x <= lonSegments; ++x) {
      final double u = x / lonSegments;
      vertices[i] = Vector3(radius * math.cos(u * math.pi * 2.0) * sv,
          radius * cv, radius * math.sin(u * math.pi * 2.0) * sv);
      texcoords[i] = Offset(1.0 - u, 1.0 - v);
      i++;
    }
  }

  i = 0;
  for (int y = 0; y < latSegments; ++y) {
    final int base1 = (lonSegments + 1) * y;
    final int base2 = (lonSegments + 1) * (y + 1);
    for (int x = 0; x < lonSegments; ++x) {
      indices[i++] = Polygon(base1 + x, base1 + x + 1, base2 + x);
      indices[i++] = Polygon(base1 + x + 1, base2 + x + 1, base2 + x);
    }
  }

  ui.Image texture = await loadImageFromAsset(texturePath);
  final Mesh mesh = Mesh(
      vertices: vertices,
      texcoords: texcoords,
      indices: indices,
      texture: texture,
      texturePath: texturePath);
  return mesh;
}
