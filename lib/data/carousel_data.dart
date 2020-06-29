import '../models/carousel_model.dart';

List<CarouselModel> _dataList = [
  CarouselModel(
      text:
          "landscaping with trees and plants can increase your property value by as much as 20 percent, according to some estimates. ",
      assetImage: "assets/images/cas1.png"),
  CarouselModel(
      text:
          "Building off the previous point, strategically placed trees can save homeowners up to 25 percent on energy bills by providing shade in the summer and windbreaks in the winter.",
      assetImage: "assets/images/cas2.png"),
  CarouselModel(
      text:
          "A tree can absorb as much as 48 pounds of carbon dioxide each year and can sequester 1 ton of carbon dioxide by the time it reaches 40 years old",
      assetImage: "assets/images/cas3.png"),
  CarouselModel(
      text:
          "Building off the previous point, strategically placed trees can save homeowners up to 25 percent on energy bills by providing shade in the summer and windbreaks in the winter.",
      assetImage: "assets/images/cas4.png"),
];

List<CarouselModel> get dataList {
  return [..._dataList];
}
