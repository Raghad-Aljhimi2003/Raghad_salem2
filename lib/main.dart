import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: Drawer(
          child: ListView(
            children: [DrawerHeader(child: Text("home"))],
          ),
        ),
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          title: Text('CV'),
          actions: [
            PopupMenuButton(
                itemBuilder: (context) => [
                      PopupMenuItem(child: Text("Settings")),
                      PopupMenuItem(child: Text("About")),
                      PopupMenuItem(child: Text("Help")),
                    ])
          ],
          centerTitle: true,
          backgroundColor: const Color.fromARGB(210, 124, 91, 106),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // القسم الأول (الصورة والاسم)
              Container(
                padding: EdgeInsets.symmetric(vertical: 25),
                color: const Color.fromARGB(255, 162, 145, 160),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage('images/e.jpg'),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'رغد بلحول',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                    Text(
                      'طالبة تقنية معلومات',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),

              Divider(thickness: 2),

              // القسم الثاني (معلومات التواصل)
              Container(
                color: const Color.fromARGB(116, 226, 221, 225),
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Email:',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('raghadaljhimi@gmail.com'),
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Phone:',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('777777777'),
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Address:',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('Hadhramout - Seiyun'),
                      ],
                    ),
                  ],
                ),
              ),

              Divider(thickness: 2),

              // القسم الثالث (المؤهلات العلمية)
              Container(
                color: const Color.fromARGB(116, 226, 221, 225),
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'المؤهلات العلمية',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green[900],
                      ),
                    ),
                    Divider(),
                    Text('• طالبة بكالوريوس في تقنية المعلومات - جامعة سيئون'),
                    Text('• كلية الحاسبات وتقنية المعلومات'),
                    Text('• المستوى الثالث - الفصل الدراسي الثاني'),
                    Text('• حاصلة على شهادة في دورة Flutter من معهد الإفادة'),
                  ],
                ),
              ),

              Divider(thickness: 2),

              // القسم الرابع (المهارات)
              Container(
                color: const Color.fromARGB(116, 226, 221, 225),
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'المهارات',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown[800],
                      ),
                    ),
                    Divider(),
                    Text('• تطوير تطبيقات Flutter'),
                    Text('• تصميم واجهات المستخدم UI/UX'),
                    Text('• التعامل مع لغة Dart'),
                    Text('• استخدام GitHub و VS Code'),
                  ],
                ),
              ),

              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
