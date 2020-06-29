import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutterappearth/widgets/carousel_item.dart';
import '../data/carousel_data.dart';

class Carousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.transparent,
        body: Container(
          child: Center(
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return CarouselItem(
                  carousel: dataList[index],
                );
              },
              autoplay: true,
              itemCount: dataList.length,
              containerHeight: MediaQuery.of(context).size.height * 0.5,
              containerWidth: MediaQuery.of(context).size.width * 0.9,
            ),
          ),
        ));
  }
}
