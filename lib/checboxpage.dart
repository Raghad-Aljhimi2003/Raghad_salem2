import 'package:flutter/material.dart';

class checboxpage extends StatefulWidget {
  const checboxpage({super.key});

  @override
  State<checboxpage> createState() => _checboxpageState();
}

class _checboxpageState extends State<checboxpage> {
  bool _icCheck=false;
  bool _icCheck1=false;
String? _selectRoidi='الخيار الاول';
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      padding: EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('مربع الاختيار checkbox'),
Row(
  children: [
    Checkbox(
        value: _icCheck,
        onChanged: (bool? newvalue){
          setState(() {
            _icCheck=newvalue!;
            print(_icCheck);


          });
        }

    ),
    Text('تفعيل الاشعارات')
  ],
),
          Row(
            children: [
              Checkbox(
                  value: _icCheck1,
                  onChanged: (bool? newvalue){
                    setState(() {
                      _icCheck1=newvalue!;
                      print(_icCheck1);
                    });
                  }
              ),
              Text('تفعيل الاشعارات')
            ],
          ),
          if(_icCheck)
            Text('الاشعارات مفعلة',style: TextStyle(color: Colors.green),),

          RadioListTile(
            title: Text('الخيار الاول'),
              value: 'الخيار الاول',
              groupValue: _selectRoidi,
              onChanged: (String? value){
              setState(() {
                _selectRoidi=value;
                print(_selectRoidi);

              });
              }
          ),
          RadioListTile(
              title: Text('الخيار الثاني'),
              value: 'الخيار الثاني',
              groupValue: _selectRoidi,
              onChanged: (String? value){
                setState(() {
                  _selectRoidi=value;
                  print(_selectRoidi);
                });
              }

          ),
          if(_selectRoidi!=null)
            Text('لقد اخترت $_selectRoidi',style: TextStyle(color: Colors.green),)
        ],
      ),
    );
  }
}
