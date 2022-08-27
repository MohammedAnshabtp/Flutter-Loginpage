import 'package:flutter/material.dart';
import 'package:sample_project/splash.dart';

main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'Ykipp Demo',
      theme: ThemeData(primarySwatch: Colors.green),
      home:SplashScreen(),
    );
  }
}

