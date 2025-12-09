import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: Drawer(
          child: ListView(
            children: [DrawerHeader(child: Text("Header"))],
          ),
        ),
        appBar: AppBar(
          title: const Text("Drawer Widget"),
          actions: [
            PopupMenuButton(
                itemBuilder: (context) => [
                      PopupMenuItem(child: Text("Settings")),
                      PopupMenuItem(child: Text("About")),
                      PopupMenuItem(child: Text("Help")),
                    ])
          ],
        ),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(children: [
                  ElevatedButton(onPressed: () {}, child: Text('Botton1')),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: const Text("elvated button "),
                  ),
                ]))),
      ),
    );
  }
}
