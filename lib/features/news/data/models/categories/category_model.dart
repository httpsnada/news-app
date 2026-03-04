class Category {
  final String id;
  final String name;

  Category({required this.id, required this.name});

  List<Category> categories = [
    Category(id: "general", name: "General"),
    Category(id: "business", name: "Business"),
    Category(id: "entertainment", name: "Entertainment"),
    Category(id: "sports", name: "Sports"),
    Category(id: "health", name: "Health"),
    Category(id: "science", name: "Science"),
    Category(id: "technology", name: "Technology"),
  ];
}
