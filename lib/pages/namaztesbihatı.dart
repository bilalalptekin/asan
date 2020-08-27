import 'package:flutter/material.dart';

//import 'package:tesbihat/pages/main.dart';
class NamazTesbihati extends StatefulWidget {
  @override
  _NamazTesbihati createState() => _NamazTesbihati();
}

int count = 0;
String tesbih ="Subhanallah";
String textSection = "";

class _NamazTesbihati extends State<NamazTesbihati> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tesbihat',
      home: Scaffold(
        backgroundColor: Colors.amber[100],
        body: ListView(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12, width: 8.0),

                //
                color: Colors.black54,
              ),
              margin: EdgeInsets.fromLTRB(75, 50, 75, 0),

              width: 450,
              height: 69,
              //padding: ,
              child: RaisedButton(
                //Padding(padding: EdgeInsets.only(top: 20))
                child: Text(
                  count.toString(),
                  style: TextStyle(
                      height: 0.93,
                      color: Colors.white,
                      fontSize: 70,
                      //fontWeight: FontWeight.bold,
                      fontFamily: 'patopian'),
                ),
              ),
            ),
            textSection(tesbih),
            counterButton(),
          ],
        ),
      ),
    );
  }

  Widget textSection(String text) {
    return Container(
      padding: const EdgeInsets.all(55),
      child: Text(text,style: TextStyle(fontSize: 50),
      ),
    );
  }

  Widget counterButton() {
    return Container(
        
        decoration: BoxDecoration(
          
            border: Border.all(color: Colors.black12, width: 3.0),
            shape: BoxShape.circle),
        width: 200,
        height: 200,
        //alignment: Alignment.center,
        margin: EdgeInsets.fromLTRB(90, 150, 90, 0),
        child: RaisedButton(
            onPressed: () {
              setState(() {
                count += 1;
              });
              if(count<=33){
                tesbih = "Subhanallah";
              }
              else if (count > 33) {
                tesbih = "Elhamdulillah";
              } if (count > 66) {
                tesbih = "Allahu Ekber";
              } if (count > 99) {
                Navigator.pushNamed(context, "/");
                count=0;
                tesbih = "Subhanallah";
              }
            },
            color: Colors.deepOrange[900],
            //textColor: Colors.white,
            shape: CircleBorder(side: BorderSide.none),
            child: Text('', style: TextStyle(fontSize: 20.0))));
  }
  Widget deneme(){}
}
