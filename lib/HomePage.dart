import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'الصفحة الرئيسية',
        style: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 67, 27, 102),
        ),
      ),
    );
  }
}
