import 'package:flutter/material.dart';
import 'package:lifeaids/homepage.dart';
import 'dart:async';

void main() {


  runApp(MaterialApp(

    debugShowCheckedModeBanner: false,  // to disable the banner
    theme: ThemeData(
      fontFamily: 'Circular',
      primaryColor:Colors.pink[900],


    ),
   home: new SplashScreen(),        //from here all code for splash screen,think control is going for splash screen code
    routes: <String, WidgetBuilder>{
      '/HomeScreen': (BuildContext context) => new HomeScreen()
    },
  ));
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/HomeScreen');
  }
  @override
  void initState() {
    super.initState();
    startTime();
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Image.asset('images/lifeaids.png',width: 100,
                  height: 100,
                  fit:BoxFit.fill),
              Padding(
                padding: const EdgeInsets.all(18.0), //to give some space
                child: new Text('COVID-19 TRACKER',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
              ),
            ],
          ),



      ),
    );
  }
}