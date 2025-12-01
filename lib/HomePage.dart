import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TextEditingController text1 = TextEditingController();
  TextEditingController text2 = TextEditingController();

  void copyText() {
    setState(() {
      text2.text = text1.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: text1,
            decoration: InputDecoration(
              labelText: 'الحقل الأول',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),
          TextField(
            controller: text2,
            readOnly: true,
            decoration: InputDecoration(
              labelText: 'الحقل الثاني',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: copyText,
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF7B2CBF),
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
            ),
            child: Text('انسخ النص'),
          ),
        ],
      ),
    );
  }
}
