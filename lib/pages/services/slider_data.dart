import 'package:news_api_app/pages/model/slider_model.dart';

List<SliderModel> getSliderData(){
  List<SliderModel> sliderList = [
    SliderModel(
        name: "Business",
        imageUrl: "lib/images/business.jpg"
    ),
    SliderModel(
        name: "Entertainment",
        imageUrl: "lib/images/entertainment.jpg"
    ),
    SliderModel(
        name: "General",
        imageUrl: "lib/images/general.jpg"
    ),SliderModel(
        name: "Health",
        imageUrl: "lib/images/health.jpg"
    ),
    SliderModel(
        name: "Science",
        imageUrl: "lib/images/science.jpg"
    ),
    SliderModel(
        name: "Sports",
        imageUrl: "lib/images/sports.jpg"
    ),
  ];

  return sliderList;
}