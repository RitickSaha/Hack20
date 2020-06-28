import 'dart:async';
import 'dart:ui' as ui;
import 'dart:math' as math;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Planet',
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
  bool checker1=true,checker2=false,checker3=false,checker4=false;
  Color ckred=Colors.red;
  Color ckgreen=Colors.green;
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
          Positioned(
              right: 50,
              bottom: 20,
              child: GestureDetector(
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
              top: 250,
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
                      top: 120,
                      left: 65,
                      child: Container(
                            height: 35,
                            width: 300,
                            child: Stack(
                              children: [
                                Positioned(
                                  bottom: 10,
                                  left: 35,
                                  child: Text(
                                    "Travel Via Car pool for 2 days",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  left: 35,
                                  child: GestureDetector(
                                      child: Container(
                                          height: 60,
                                          width: 60,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            gradient: checker1 ? new RadialGradient(
                                              colors: <Color>[Colors.black, Colors.green],
                                            ): new RadialGradient(
                                              colors: <Color>[Colors.black, Colors.red],
                                            ),
                                          ),
                                          child: Positioned(
                                            child: Center(
                                                child: Icon(!add ? Icons.done : Icons.close)),
                                          )),
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
                        ShaderMask(
                          shaderCallback: (Rect bounds) {
                            return LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.topRight,
                              colors: [Colors.redAccent, Colors.transparent],
                              stops: [0.8, 1],
                            ).createShader(bounds);
                          },
                          blendMode: BlendMode.dstIn,
                          child:
                          Positioned(
                                  top: 5,
                                  left: 5,
                                  child: Image.asset(
                                    "assets/Path 14.png",
                                    scale: 0.8,
                                  ),
                                ),
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
                            stops: [0, 0.5],
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
                                  child: Container(
                                    child: Icon(Icons.view_module, size: 35),
                                  ),
                                )),
                            Positioned(
                                right: 20,
                                top: 100,
                                child: GestureDetector(
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
                          child: Positioned(
                            child: Center(
                                child: Icon(!add ? Icons.close : Icons.add)),
                          )),
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
