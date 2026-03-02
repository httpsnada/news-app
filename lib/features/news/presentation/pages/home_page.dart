import 'package:flutter/material.dart';
import 'package:news_app/core/di/service_locator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    testApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Home Page"),),
    );
  }

  void testApi() async {
    try {
      final repo = ServiceLocator.newsRepository;
      final articles = await repo.getArticlesBySource(source: "bbc-sport");
      print("here are the status : ");
      print(articles.articles?.length);
      print(articles.totalResults);
    } catch (e) {
      print(e.toString());
    }
  }
}

