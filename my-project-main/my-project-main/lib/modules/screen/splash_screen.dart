import 'package:flutter/material.dart';

import 'login.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>login()));
    });
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body:
      Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Column(
          children: [
            Expanded(
                child: Center(
                  child:Image.asset("assets/images/image.png",height: 150,width: 150,),


                ),
            ),
            const SizedBox(height: 15),
            const CircularProgressIndicator(
    color: Colors.white,
    strokeWidth: 3,
      ),
            const SizedBox(height: 30),
            const Text("Developed by Ayah Attamimi",style: TextStyle(color: Colors.black),)
          ],
        ),
      ),

    );
  }
}
