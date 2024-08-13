import 'package:news_api_app/model/category_model.dart';

List<CategoryModel> getCategories(){
  List<CategoryModel> categoryList = [
    CategoryModel(
      categoryName: "Business",
      image: "lib/images/business.jpg"
    ),
    CategoryModel(
        categoryName: "Entertainment",
        image: "lib/images/entertainment.jpg"
    ),
    CategoryModel(
        categoryName: "General",
        image: "lib/images/general.jpg"
    ),CategoryModel(
        categoryName: "Health",
        image: "lib/images/health.jpg"
    ),
    CategoryModel(
        categoryName: "Science",
        image: "lib/images/science.jpg"
    ),
    CategoryModel(
        categoryName: "Sports",
        image: "lib/images/sports.jpg"
    ),
  ];

  return categoryList;
}