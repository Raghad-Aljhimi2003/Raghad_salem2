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
                children: [
                  DrawerHeader(
                    decoration: BoxDecoration(color: Colors.blue),
                    child: Center(
                      child: Text(
                        'الاقسام',
                        style: TextStyle(color: Colors.yellow, fontSize: 30),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.child_care),
                    title: Text(
                      'قسم الأطفال ',
                      style: TextStyle(color: Colors.yellow, fontSize: 30),
                    ),
                    onTap: () {
                      print('قسم الأطفال  ');
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.female),
                    title: Text(
                      'قسم النساء',
                      style: TextStyle(color: Colors.yellow, fontSize: 30),
                    ),
                    onTap: () {
                      print('قسم النساء');
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.male),
                    title: Text(
                      'قسم الرجال',
                      style: TextStyle(color: Colors.yellow, fontSize: 30),
                    ),
                    onTap: () {
                      print('قسم الرجال');
                    },
                  ),
                ],
              ),
            ),
            appBar: AppBar(
              backgroundColor: Colors.amberAccent,
              title: Text("Rowaa store",
                  style: TextStyle(color: Colors.black, fontSize: 40)),
              actions: [
                PopupMenuButton(
                    itemBuilder: (context) => [
                          PopupMenuItem(
                            child: Text(
                              'help',
                              style:
                                  TextStyle(color: Colors.yellow, fontSize: 30),
                            ),
                            onTap: () {
                              print('help');
                            },
                          ),
                          PopupMenuItem(
                            child: Text(
                              'seting',
                              style:
                                  TextStyle(color: Colors.yellow, fontSize: 30),
                            ),
                            onTap: () {
                              print('seting');
                            },
                          ),
                        ])
              ],
            ),
            body: Center(
                child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              print('Raghad');
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black),
                            child: Text(
                              'I`m Raghad Salem',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                          ),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        'Welcom to my App and my name is raghad salem omar i am from yemen this the first app in the flutter',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      Text(
                                        'Welcom to my App and my name is raghad salem omar i am from yemen this the first app in the flutter',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      Text(
                                        'Welcom to my App and my name is raghad salem omar i am from yemen this the first app in the flutter',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      Text(
                                        'Welcom to my App and my name is raghad salem omar i am from yemen this the first app in the flutter',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      Text(
                                        'Welcom to my App and my name is raghad salem omar i am from yemen this the first app in the flutter',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      Text(
                                        'Welcom to my App and my name is raghad salem omar i am from yemen this the first app in the flutter',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      Text(
                                        'Welcom to my App and my name is raghad salem omar i am from yemen this the first app in the flutter',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      Text(
                                        'Welcom to my App and my name is raghad salem omar i am from yemen this the first app in the flutter',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      Text(
                                        'Welcom to my App and my name is raghad salem omar i am from yemen this the first app in the flutter',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      Text(
                                        'Welcom to my App and my name is raghad salem omar i am from yemen this the first app in the flutter',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      Text(
                                        'Welcom to my App and my name is raghad salem omar i am from yemen this the first app in the flutter',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      Text(
                                        'Welcom to my App and my name is raghad salem omar i am from yemen this the first app in the flutter',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      Text(
                                        'Welcom to my App and my name is raghad salem omar i am from yemen this the first app in the flutter',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      Text(
                                        'Welcom to my App and my name is raghad salem omar i am from yemen this the first app in the flutter',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      Text(
                                        'Welcom to my App and my name is raghad salem omar i am from yemen this the first app in the flutter',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      Text(
                                        'Welcom to my App and my name is raghad salem omar i am from yemen this the first app in the flutter',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      Text(
                                        'Welcom to my App and my name is raghad salem omar i am from yemen this the first app in the flutter',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      Text(
                                        'Welcom to my App and my name is raghad salem omar i am from yemen this the first app in the flutter',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      Text(
                                        'Welcom to my App and my name is raghad salem omar i am from yemen this the first app in the flutter',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      Text(
                                        'Welcom to my App and my name is raghad salem omar i am from yemen this the first app in the flutter',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      Text(
                                        'Welcom to my App and my name is raghad salem omar i am from yemen this the first app in the flutter',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      Text(
                                        'Welcom to my App and my name is raghad salem omar i am from yemen this the first app in the flutter',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      Text(
                                        'Welcom to my App and my name is raghad salem omar i am from yemen this the first app in the flutter',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      Text(
                                        'Welcom to my App and my name is raghad salem omar i am from yemen this the first app in the flutter',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      Text(
                                        'Welcom to my App and my name is raghad salem omar i am from yemen this the first app in the flutter',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      Text(
                                        'Welcom to my App and my name is raghad salem omar i am from yemen this the first app in the flutter',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      Text(
                                        'Welcom to my App and my name is raghad salem omar i am from yemen this the first app in the flutter',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      Text(
                                        'Welcom to my App and my name is raghad salem omar i am from yemen this the first app in the flutter',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      Text(
                                        'Welcom to my App and my name is raghad salem omar i am from yemen this the first app in the flutter',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      Text(
                                        'Welcom to my App and my name is raghad salem omar i am from yemen this the first app in the flutter',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      Text(
                                        'Welcom to my App and my name is raghad salem omar i am from yemen this the first app in the flutter',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      Text(
                                        'Welcom to my App and my name is raghad salem omar i am from yemen this the first app in the flutter',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      Text(
                                        'Welcom to my App and my name is raghad salem omar i am from yemen this the first app in the flutter',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      Text(
                                        'Welcom to my App and my name is raghad salem omar i am from yemen this the first app in the flutter',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      Text(
                                        'Welcom to my App and my name is raghad salem omar i am from yemen this the first app in the flutter',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      Text(
                                        'Welcom to my App and my name is raghad salem omar i am from yemen this the first app in the flutter',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      Text(
                                        'Welcom to my App and my name is raghad salem omar i am from yemen this the first app in the flutter',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      Text(
                                        'Welcom to my App and my name is raghad salem omar i am from yemen this the first app in the flutter',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      Text(
                                        'Welcom to my App and my name is raghad salem omar i am from yemen this the first app in the flutter',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      Text(
                                        'Welcom to my App and my name is raghad salem omar i am from yemen this the first app in the flutter',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      Text(
                                        'Welcom to my App and my name is raghad salem omar i am from yemen this the first app in the flutter',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    )))));
  }
}
