import 'package:flutter/material.dart';
import 'package:tesbihat/pages/namaztesbihat%C4%B1.dart';
import 'package:tesbihat/pages/ozelTesbihat.dart';
import 'package:tesbihat/pages/hadistesbihati.dart';

//import 'package:tesbihat/pages/main.dart';

class Home extends StatefulWidget {
  
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(backgroundColor: Colors.amber[300],title: Text("Tesbihat",style: TextStyle(color:Colors.black54),),centerTitle: true,),
      backgroundColor: Colors.amber[100],
   
      body: ListView(
        children: <Widget>[
         
           Row(
            children: <Widget>[
              SizedBox(
            width: 70,
          ),
              Container(
                height: 100,
                child: VerticalDivider(
                  color: Colors.black54,
                  thickness: 5,
                  width: 2,
                  indent: 0,
                  endIndent: 0,
                ),
              ),
               SizedBox(
            width: 260,
          ),
          
              Container(
                height: 100,
                child: VerticalDivider(
                  color: Colors.black54,
                  thickness: 5,
                  width: 2,
                  indent: 0,
                  endIndent: 0,
                ),
              ),
            ],
          ),
          namazTesbihatButton(),
          
          Row(
            children: <Widget>[
              SizedBox(
            width: 70,
          ),
              Container(
                height: 50,
                child: VerticalDivider(
                  color: Colors.black54,
                  thickness: 5,
                  width: 2,
                  indent: 0,
                  endIndent: 0,
                ),
              ),
               SizedBox(
            width: 30,
            //height: 50,
          ),
          // Container(
          //       height: 50,
          //       child: VerticalDivider(
          //         color: Colors.blue,
          //         thickness: 200,
          //         width: 2,
          //         indent: 0,
          //         endIndent: 0,
          //       ),
          //     ),
            SizedBox(width: 230,),
              Container(
                height: 50,
                child: VerticalDivider(
                  color: Colors.black54,
                  thickness: 5,
                  width: 2,
                  indent: 0,
                  endIndent: 0,
                ),
              ),
            ],
          ),
          ozelTesbihatButton(),
          Row(
            children: <Widget>[
              SizedBox(
            width: 70,
          ),
              Container(
                height: 50,
                child: VerticalDivider(
                  color: Colors.black54,
                  thickness: 5,
                  width: 2,
                  indent: 0,
                  endIndent: 0,
                ),
              ),
               SizedBox(
            width: 260,
          ),
              Container(
                height: 50,
                child: VerticalDivider(
                  color: Colors.black54,
                  thickness: 5,
                  width: 2,
                  indent: 0,
                  endIndent: 0,
                ),
              ),
            ],
          ),
          hadisTesbihatButton(),
           Row(
            children: <Widget>[
              SizedBox(
            width: 70,
          ),
              Container(
                height: 70,
                child: VerticalDivider(
                  color: Colors.black54,
                  thickness: 5,
                  width: 2,
                  indent: 0,
                  endIndent: 0,
                ),
              ),
               SizedBox(
            width: 260,
          ),
              Container(
                height: 70,
                child: VerticalDivider(
                  color: Colors.black54,
                  thickness: 5,
                  width: 2,
                  indent: 0,
                  endIndent: 0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget namazTesbihatButton() {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black12, width: 8.0),

            //
            color: Colors.black54,
            borderRadius: new BorderRadius.circular(20)),
        margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: ButtonTheme(
            height: 100,
            child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NamazTesbihati()),
                  );
                },
                child: Text("Namaz Tesbihatı",
                    style: TextStyle(fontSize: 30, color: Colors.amber[100])),
                color: Colors.deepOrange[900],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)))));
  }

  Widget hadisTesbihatButton() {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black12, width: 8.0),

            //
            color: Colors.black54,
            borderRadius: new BorderRadius.circular(20)),
        margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: ButtonTheme(
            height: 100,
            child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HadisTesbihati()),
                  );
                },
                child: Text("Hadis Tesbihatı",
                    style: TextStyle(fontSize: 30, color: Colors.amber[100])),
                color: Colors.deepOrange[900],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)))));
  }

  Widget ozelTesbihatButton() {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black12,
              width: 8.0,
            ),
            color: Colors.black54,
            borderRadius: new BorderRadius.circular(20)),
        margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: ButtonTheme(
            height: 100,
            child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OzelTesbihat()),
                  );
                },
                child: Text("Özel Tesbihat",
                    style: TextStyle(fontSize: 30, color: Colors.amber[100])),
                color: Colors.deepOrange[900],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)))));
  }
}

// Widget ozelTesbihatButton() {
//   return Container(
//       child: OutlineButton(

//           splashColor: Colors.green,
//           onPressed: () {},
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//           highlightElevation: 0,

//           //borderSide: BorderSide(color: Colors.grey),
//           child: Padding(
//               padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
//               child: Column(children: <Widget>[
//                 Row(
//                     mainAxisSize: MainAxisSize.min,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       Padding(
//                           padding: const EdgeInsets.only(left: 0),
//                           child: Text('Sign in with Google',
//                               style: TextStyle(
//                                   fontSize: 20, color: Colors.black)))
//                     ])
//               ]))));
// }
