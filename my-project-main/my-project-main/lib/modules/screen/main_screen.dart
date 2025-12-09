import 'package:flutter/material.dart';
import 'product.dart';
import 'communication.dart';
import 'account.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    product(),
    communication(),
    account(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(
        //title: Text(_navTitle(_currentIndex)),
       // centerTitle: true,
     // ),
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (idx) => setState(() => _currentIndex = idx),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: 'المنتجات',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message_outlined),
            label: 'تواصل',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'حسابي',
          ),
        ],
      ),
    );
  }

  String _navTitle(int index) {
    switch (index) {
      case 0:
        return 'المنتجات';
      case 1:
        return 'التواصل';
      case 2:
      default:
        return 'حسابي';
    }
  }
}
