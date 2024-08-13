import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:news_api_app/components/category_tile.dart';
import 'package:news_api_app/model/category_model.dart';
import 'package:news_api_app/model/slider_model.dart';
import 'package:news_api_app/services/data.dart';
import 'package:news_api_app/services/slider_data.dart';
import 'package:news_api_app/utils/image_slider_builder.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = [];
  List<SliderModel> sliderList = [];

  int _activeIndex = 0;

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
            SizedBox(
              width: 5,
            ),
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Align children to the left
        children: [
          SizedBox(height: 20),
          SizedBox(
            height: 100, // Adjust the height of the category list
            child: ListView.builder(
              padding: EdgeInsets.only(left: 10),
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
          const Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Breaking News!",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "View all",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10,),

          CarouselSlider.builder(
            itemCount: sliderList.length,
            itemBuilder: (context, index, realIndex) {
              final res = sliderList[index];
              return buildImage(res.imageUrl!, index, context, res.name!);
            },
            options: CarouselOptions(
              height: 200,
              viewportFraction: .7,
              enlargeCenterPage: true,
              autoPlay: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _activeIndex = index;
                });
              },
              enlargeStrategy: CenterPageEnlargeStrategy.height,
            ),
          ),
          SizedBox(height: 30.0),
          Center(child: pageIndicator(_activeIndex, sliderList.length))
        ],
      ),
    );
  }
}
