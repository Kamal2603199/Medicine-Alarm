import 'package:flutter/material.dart';
import 'package:untitled/splash_screen.dart';

import 'medicine_info.dart';
//import 'device_settings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen( ),
      debugShowCheckedModeBanner: false,
    );
  }
}

