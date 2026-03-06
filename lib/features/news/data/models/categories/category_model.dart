import 'package:news_app/core/constants/app_assets.dart';

class Category {
  final String id;
  final String name;
  final String imageLight;
  final String imageDark;

  Category({
    required this.id,
    required this.name,
    required this.imageLight,
    required this.imageDark,
  });

  List<Category> categories = [
    Category(
      id: "general",
      name: "General",
      imageLight: AppImages.general,
      imageDark: AppImages.generalDark,
    ),
    Category(
      id: "business",
      name: "Business",
      imageLight: AppImages.business,
      imageDark: AppImages.businessDark,
    ),
    Category(
      id: "entertainment",
      name: "Entertainment",
      imageLight: AppImages.entertainment,
      imageDark: AppImages.entertainmentDark,
    ),
    Category(
      id: "health",
      name: "Health",
      imageLight: AppImages.health,
      imageDark: AppImages.healthDark,
    ),
    Category(
      id: "science",
      name: "Science",
      imageLight: AppImages.science,
      imageDark: AppImages.scienceDark,
    ),
    Category(
      id: "technology",
      name: "Technology",
      imageLight: AppImages.technology,
      imageDark: AppImages.technologyDark,
    ),
    Category(
      id: "sports",
      name: "Sports",
      imageLight: AppImages.sport,
      imageDark: AppImages.sportDark,
    ),
  ];
}
