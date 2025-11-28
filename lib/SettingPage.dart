import 'package:flutter/material.dart';

class Settingpage extends StatelessWidget {
  const Settingpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.settings, size: 50, color: Color(0xFF7B2CBF)),
          SizedBox(height: 16),
          Text(
            'الإعدادات',
            style: TextStyle(fontSize: 24, color: Color(0xFF7B2CBF)),
          ),
        ],
      ),
    );
  }
}
