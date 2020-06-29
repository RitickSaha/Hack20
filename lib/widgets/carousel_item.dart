import 'package:flutter/material.dart';
import '../models/carousel_model.dart';

class CarouselItem extends StatelessWidget {
  final CarouselModel carousel;

  CarouselItem({this.carousel});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.45,
      decoration: BoxDecoration(
        color: Colors.transparent,
          image: DecorationImage(
        image: AssetImage(carousel.assetImage),
      )),
      child: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            carousel.text,
            style: TextStyle(
                fontFamily: "Rajdhani", fontSize: 22, color: Colors.white),
            softWrap: true,
          ),
        ),
      ),
    );
  }
}
