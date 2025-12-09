import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesPage extends StatefulWidget {
  const SharedPreferencesPage({super.key});

  @override
  State<SharedPreferencesPage> createState() => _SharedPreferencesPageState();
}

class _SharedPreferencesPageState extends State<SharedPreferencesPage> {
  final _contollre1 = TextEditingController();
  final _contollre2 = TextEditingController();

  Future<void> _Storgedata() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('Textfild1', _contollre1.text.trim());
    _contollre1.clear();
  }

  Future<void> _getdata() async {
    final prefs = await SharedPreferences.getInstance();
    final Textfild1 = prefs.getString('Textfild1');
    _contollre2.text = Textfild1 ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SharedPreferences',style: TextStyle(color: Colors.white),),
        leading: Icon(Icons.arrow_back,color:Colors.white ,),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: _contollre1,
              decoration: InputDecoration(labelText: 'الحقل الاول'),
            ),
            ElevatedButton(
                onPressed: _Storgedata, child: Text('تخزين')),
            TextField(
              controller: _contollre2,
              decoration: InputDecoration(labelText: 'الحقل الثاني'),
            ),
            ElevatedButton(onPressed: _getdata, child: Text('جلب')),
          ],
        ),
      ),
    );
  }
}
