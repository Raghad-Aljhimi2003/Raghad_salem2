import 'package:flutter/material.dart';

class Searchpage extends StatelessWidget {
  const Searchpage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> items = [
      'العنصر الأول',
      'العنصر الثاني',
      'العنصر الثالث',
      'العنصر الرابع',
      'العنصر الخامس',
    ];

    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(Icons.label, color: Color(0xFF7B2CBF)),
          title: Text(items[index]),
          trailing: Icon(Icons.arrow_forward_ios, size: 16),
        );
      },
    );
  }
}
