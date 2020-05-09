import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lifeaids/data.dart';
import 'package:lifeaids/india.dart';
import 'package:lifeaids/panels/worldwidepanel.dart';
import 'package:lifeaids/panels/countries.dart';
import 'package:http/http.dart'as http;

class HomeScreen extends StatefulWidget {    //just type stful and the ide will do the remaining
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Map worldData;   //to get data
  fetchWorldwideData()async{
    http.Response response = await http.get('https://corona.lmao.ninja/v2/all');
    setState(() {
      worldData= json.decode(response.body);
    });
  }


  List countryData;   //to get data of countries
  fetchCountryData()async{
    http.Response response = await http.get('https://corona.lmao.ninja/v2/countries/USA,canada,israel,uae,uk'); //manually selected countries
    setState(() {
      countryData= json.decode(response.body);
    });
  }


  @override
  void initState() {
    fetchWorldwideData();
    fetchCountryData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(


        centerTitle: true,    //no use seen in my Redmi already was at begining

        title:  Text('COVID-19 TRACKER',),

        actions: <Widget>[
          IconButton(
            padding: EdgeInsets.all(4.0),
            icon: Image.asset('images/lifeaids.png'),
          )
        ],

      ),      //Appbar closed here SO COMMA MUST BE GIVEN

      body: SingleChildScrollView(child: Column(   //FIND OUT WHY THIS IS USED SINGL
      children: <Widget>[
        Container(

          alignment: Alignment.center,
          height: 100,
          color: Colors.lightGreen[800],
          padding: EdgeInsets.all(10),  // to give padding equally from all sides
          child: Text(DataSource.qoute,style: TextStyle(color: Colors.orange[100],fontWeight: FontWeight.bold)),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(vertical:10.0), // to give the text some padding
          child: Text('Worldwide',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
        ),
        worldData == null?CircularProgressIndicator(): WorldwidePanel(worldData: worldData,),  //to show something till value fetches

        Text('+ shows extra number of cases today',style: TextStyle(fontSize: 12),),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Text('Countries',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
        ),

        SizedBox(height: 10,),


        Row(
          children: <Widget>[
            SizedBox(width: 25,),
            Text('*Deaths',style: TextStyle(color: Colors.red[900],fontSize:12,fontWeight: FontWeight.bold),),
            SizedBox(width: 15,),
            Text('*Deaths Today',style: TextStyle(color: Colors.red,fontSize:12,fontWeight: FontWeight.bold),),
            SizedBox(width: 15,),
            Text('*Cases Today',style: TextStyle(color: Colors.blue,fontSize:12,fontWeight: FontWeight.bold),),
            SizedBox(width: 15,),
            Text('*Total Cases',style: TextStyle(color: Colors.green,fontSize:12,fontWeight: FontWeight.bold),),



          ],
        ),

        countryData == null?Container():selectCountries(countryData: countryData,), //to show individual countries   //in the children of Column

        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>IndiaSpecific())
            );
          },
          child: Container(
            decoration: BoxDecoration(

              color: Colors.pink[900],      //if box decoration given color must be declared inside
              borderRadius: BorderRadius.circular(15),

            ),

              padding: EdgeInsets.all(10),  //to give some padding
              child: Text('INDIA SPECIFIC',style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold,color: Colors.white),)
          ),
        ),
        Text('Developed by Denin, API provided by Ninja V2',style: TextStyle(fontSize: 12),),
      ],
      ),),

    );
  }
}

