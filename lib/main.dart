import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:news_app/screens/home_detail_search.dart';





void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "News App",
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home:  HomeScreen(),
      getPages: [
        GetPage(name: '/search', page: () =>  SearchScreen()),
      ],
    );
  }
}



