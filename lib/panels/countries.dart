import 'package:flutter/material.dart';

class selectCountries extends StatelessWidget {

  final List countryData;

  const selectCountries({Key key, this.countryData}) : super(key: key);  // auto suggested by ide on pressing the red bulb



  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,

        itemBuilder: (context,index){

        return Container(
          margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),  //to give margin around flag and data

          child: Row(
            children: <Widget>[
              SizedBox(width: 10,),


              Image.network(countryData[index]['countryInfo']['flag'],height: 30,),   //countryInfo is in that JSon while index is not
              SizedBox(width: 5,),   //to give some space after the image
              Text(countryData[index]['country'],style: TextStyle(fontWeight: FontWeight.bold),),
              SizedBox(width: 20,),

              Text(countryData[index]['deaths'].toString(),style: TextStyle(color: Colors.red[900],fontWeight: FontWeight.bold),),
              //SizedBox(width: 50,),    //later when needed give space


              Text(', '+countryData[index]['todayDeaths'].toString(),style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
              Text(', '+countryData[index]['todayCases'].toString(),style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),),
              Text(', '+countryData[index]['cases'].toString(),style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold),),

            ],
          ),
        );
    },
      itemCount: 5,),
    );
}
}