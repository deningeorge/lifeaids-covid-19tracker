import 'package:flutter/material.dart';

class WorldwidePanel extends StatelessWidget {

  final Map worldData;

  const WorldwidePanel({Key key, this.worldData}) : super(key: key);  //autosuggested by IDE
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        shrinkWrap: true, //to shrink the grid and not make it use all space
        physics: NeverScrollableScrollPhysics(),   //to make the grid never scrollable..
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 2),  //regarding the size study well
        children: <Widget>[
          StatusPanel(
            title: 'CONFIRMED',
            panelColor: Colors.grey[350],
            textColor: Colors.grey[700],
            count: worldData['cases'].toString(),
            secondarycount: worldData['todayCases'].toString(),  //test

          ),
          StatusPanel(
            title: 'ACTIVE',
            panelColor: Colors.blue[100],
            textColor: Colors.blue,
            count: worldData['active'].toString(),


          ),
          StatusPanel(
            title: 'RECOVERED',
            panelColor: Colors.green[100],
            textColor: Colors.green,
            count: worldData['recovered'].toString(),

          ),
          StatusPanel(
            title: 'DEATHS',
            panelColor: Colors.red[100],
            textColor: Colors.red,
            count: worldData['deaths'].toString(),
            secondarycount: worldData['todayDeaths'].toString(),  //test
          ),
        ],
      ),
    );
  }
}


class StatusPanel extends StatelessWidget{

  final Color panelColor;
  final Color textColor;
  final String title; // for recovered, affected etc
  final String count;//this count includes counts of confirmed,active ,recovered,deaths.
  final String secondarycount; //this count stores the number of cases today

  const StatusPanel({Key key, this.panelColor, this.textColor, this.title, this.count,this.secondarycount}) : super(key: key);  // auto suggested by ide create constructer
  @override
  Widget build(BuildContext context) {



    double width= MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.all(4),
      height: 80,width: width/2,

      decoration: BoxDecoration(
          color: panelColor,   //when decoration given color must be inside
          borderRadius: BorderRadius.all(Radius.circular(30))
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // to make text centre
        children: <Widget>[
          Text(title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: textColor),),
          Text(count,style: TextStyle(fontSize: 16,color:textColor,fontWeight: FontWeight.bold),),
          if(secondarycount!=null)
            Text('+'+secondarycount,style: TextStyle(fontSize: 12,color:textColor,fontWeight: FontWeight.bold),),


        ],


      ),
    );
  }
}

