import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class IndiaSpecific extends StatefulWidget {
  @override
  _IndiaSpecificState createState() => _IndiaSpecificState();
}

class _IndiaSpecificState extends State<IndiaSpecific> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(


        centerTitle: true,    //no use seen in my Redmi already was at begining

        title:  Text('INDIA SPECIFIC',),

        actions: <Widget>[
          IconButton(
            padding: EdgeInsets.all(4.0),
            icon: Image.asset('images/lifeaids.png'),
          )
        ],

      ),      //Appbar closed here SO COMMA MUST BE GIVEN
      body: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: "https://www.covid19india.org",
      ),


    );
  }
}
