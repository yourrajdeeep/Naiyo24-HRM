import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'routes/route.dart';
import 'widgets/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Naiyo24 HRM',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      initialRoute: '/',
      getPages: RouteClass.routes,
    );
  }
}
