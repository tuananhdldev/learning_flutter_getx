import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:learning_getx/app/routes/app_pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "User Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      transitionDuration: Duration(milliseconds: 900),
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
    );
  }
}
