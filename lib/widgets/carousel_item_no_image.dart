import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterappearth/models/carousel_model_no_image.dart';
import '../models/carousel_model.dart';

class CarouselItem extends StatelessWidget {
  final CarouselModel_no_image carousel;

  CarouselItem({this.carousel});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.45,
      child: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            carousel.text,
            style: TextStyle(
                fontFamily: "Rajdhani", fontSize: 18, color: Colors.white
            ),
            textAlign: TextAlign.center,
            softWrap: true,
          ),
        ),
      ),
    );
  }
}
