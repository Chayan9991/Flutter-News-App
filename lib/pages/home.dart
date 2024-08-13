import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:news_api_app/components/category_tile.dart';
import 'package:news_api_app/pages/model/category_model.dart';
import 'package:news_api_app/pages/model/slider_model.dart';
import 'package:news_api_app/pages/services/data.dart';
import 'package:news_api_app/pages/services/slider_data.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = [];
  List<SliderModel> sliderList =[];

  @override
  void initState() {
    categories = getCategories();
    sliderList = getSliderData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Flutter",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 5,),
            Text(
              "News",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 20),
            Container(
              child: Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.only(left: 10),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return CategoryTile(
                      image: categories[index].image!,
                      categoryName: categories[index].categoryName!,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}