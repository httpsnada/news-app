import 'package:news_app/core/constants/app_assets.dart';

class CategoryModel {
  final String id;
  final String name;
  final String imageLight;
  final String imageDark;

  CategoryModel({
    required this.id,
    required this.name,
    required this.imageLight,
    required this.imageDark,
  });

  static List<CategoryModel> categories = [
    CategoryModel(
      id: "general",
      name: "General",
      imageLight: AppImages.generalDark,
      imageDark: AppImages.general,
    ),
    CategoryModel(
      id: "business",
      name: "Business",
      imageLight: AppImages.businessDark,
      imageDark: AppImages.business,
    ),
    CategoryModel(
      id: "entertainment",
      name: "Entertainment",
      imageLight: AppImages.entertainmentDark,
      imageDark: AppImages.entertainment,
    ),
    CategoryModel(
      id: "health",
      name: "Health",
      imageLight: AppImages.healthDark,
      imageDark: AppImages.health,
    ),
    CategoryModel(
      id: "science",
      name: "Science",
      imageLight: AppImages.scienceDark,
      imageDark: AppImages.science,
    ),
    CategoryModel(
      id: "technology",
      name: "Technology",
      imageLight: AppImages.technologyDark,
      imageDark: AppImages.technology,
    ),
    CategoryModel(
      id: "sports",
      name: "Sports",
      imageLight: AppImages.sportDark,
      imageDark: AppImages.sport,
    ),
  ];
}
