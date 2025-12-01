import 'package:flutter/material.dart';

class Profilepage extends StatelessWidget {
  const Profilepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.person, size: 50, color: Color(0xFF7B2CBF)),
          SizedBox(height: 16),
          Text(
            'حسابي',
            style: TextStyle(fontSize: 24, color: Color(0xFF7B2CBF)),
          ),
        ],
      ),
    );
  }
}
