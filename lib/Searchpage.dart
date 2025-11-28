import 'package:flutter/material.dart';

class Searchpage extends StatelessWidget {
  const Searchpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search, size: 50, color: Color(0xFF7B2CBF)),
          SizedBox(height: 16),
          Text(
            'البحث',
            style: TextStyle(fontSize: 24, color: Color(0xFF7B2CBF)),
          ),
        ],
      ),
    );
  }
}
