import 'package:flutter/material.dart';
import 'package:myprojectt/modules/screen/account.dart';
import 'package:myprojectt/modules/screen/login.dart';
import 'package:myprojectt/modules/screen/splash_screen.dart';
import 'package:myprojectt/modules/screen/register.dart';
import 'modules/screen/communication.dart';
import 'modules/screen/product.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),

    );
  }
}



