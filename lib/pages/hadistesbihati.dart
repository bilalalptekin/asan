import 'package:flutter/material.dart';
import 'package:tesbihat/pages/ozelTesbihatCounter.dart';


//import 'package:tesbihat/pages/main.dart';
class HadisTesbihati extends StatefulWidget {
  @override
  _HadisTesbihati createState() => _HadisTesbihati();
}

class _HadisTesbihati extends State<HadisTesbihati> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tesbihat',
      home: Scaffold(
        backgroundColor: Colors.amber[100],
        body: ListView(
          children: <Widget>[
          
            appsRecommendedContainer(),
            
          ],
        ),
      ),
    );
  }

  Widget appsRecommendedContainer() {
    return Container(
        height: 660.0,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            hadisLer("Allahu-Ekber"),
            
            hadisLer("Bismillahirrahmanirrahim"),
            
            hadisLer("Elhamdulillah"),
            
            hadisLer("Le ilahe İllallah"),
            
            hadisLer("Subhanallah"),
            
            hadisLer("Salavat"),
          ],
        ));
  }

 Widget hadisLer(String gelenDeger)
 {
return Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black12,
              width: 8.0,
            ),
            color: Colors.black54,
            borderRadius: new BorderRadius.circular(20)),
        margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: ButtonTheme(
            height: 100,
            child: RaisedButton(
                onPressed: () {
                     Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OzelTesbihatCounter()),
                  );
                },
                child: Text(gelenDeger,
                    style: TextStyle(fontSize: 30, color: Colors.amber[100])),
                color: Colors.deepOrange[900],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)))));
 }
}