import 'package:flutter/material.dart';
import 'package:tesbihat/pages/ozelTesbihatCounter.dart';
import 'package:tesbihat/pages/model/zikir.dart';
import 'package:tesbihat/db/database_provider.dart';
import 'package:tesbihat/bloc/zikir_bloc.dart';
import 'package:tesbihat/events/add_zikir.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OzelTesbihat extends StatefulWidget {
  final Zikir ozelTesbihat;
  final int tesbihatSayisi;
  final int kalanZikirSayisi;
  final bool isFinished;
  //String tesbihatSayisitemizle="";
  OzelTesbihat(
      {this.ozelTesbihat,
      this.tesbihatSayisi,
      this.isFinished,
      this.kalanZikirSayisi});

  @override
  State<StatefulWidget> createState() {
    return _OzelTesbihatPageState();
  }
  

}

// class OzelTesbihatPage extends StatefulWidget {
//   @override
//   _OzelTesbihatPageState createState() => _OzelTesbihatPageState();
// }

class _OzelTesbihatPageState extends State<OzelTesbihat> {

  
   TextEditingController ozeltesbihatController = TextEditingController();
   TextEditingController tesbihatsayisiController = TextEditingController();
 // TextEditingController temizleController = TextEditingController();
  String _ozelTesbihat;
  String _tesbihatSayisi;
  String _kalanZikirSayisi;
  bool _isFinished;
  FocusNode myFocusNode = new FocusNode();

  bool pressAttentiontesbihat = false;
  bool pressAttentiontesbihatSayisi = false;

  Color myHexColor = Color(0xffed4c2f);
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.amber[100],
      body: Container(
        child: SingleChildScrollView(
          //key: _formKey,
          child: new Column(
            children: <Widget>[
              SizedBox(height: 30),
              buildZikirBasligi(),
              buildzikirSayisi(),
              buttonBuilderbutton(),
              appsRecommendedContainer(),
             //hadisLer(_ozelTesbihat)
              
            ],

          ),
// bisey(),
        ),
        
      ),
    );
  }
  Widget buttonBuilderbutton(){
    return RaisedButton(child: Text("Kaydet"),
                          onPressed: () {
                            appsRecommendedContainer();
                            // _ozelTesbihat=ozeltesbihatController.text;
                            // _tesbihatSayisi=tesbihatsayisiController.text;

                            // // if (!_formKey.currentState.validate()) {
                            // //   return;
                            // // }

                            // // _formKey.currentState.save();

                            // Zikir zikir = Zikir(
                            //   zikirBasligi: _ozelTesbihat,
                            //   zikirSayisi: _tesbihatSayisi,
                            //   isFinished: true,
                            //   kalanZikirSayisi: _kalanZikirSayisi,
                            // );
                          //initState();
                            // DatabaseProvider.db.insert(zikir);                            
                          setState(() {
                            
                            // appsRecommendedContainer();
                            
                          });
                            //Navigator.pop(context);
                          },
                          
                          color: Colors.tealAccent[700],
                          //color: Colors.blueGrey[800],
                          textColor: Colors.white,
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 10));
  }
  void temizleTesbihat() {
    setState(() {
      pressAttentiontesbihat = false;
      _ozelTesbihat = "";
    });
  }

  void temizleTesbihatSayisi() {
    setState(() {
      pressAttentiontesbihatSayisi = false;
      _tesbihatSayisi = "";
    });
  }

  Widget appsRecommendedContainer() {
    return Container(
        height: 600.0,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
              hadisLer("_ozelTesbihat")
          ],
        ));
  }
  Widget isFinished(){
    return SwitchListTile(
      title: Text("Btti mi?", style: TextStyle(fontSize: 20)),
      value: _isFinished,
      onChanged: (bool newValue) => setState(() {
        _isFinished = newValue;
      }),
    );
  }
  @override
  void initState() {
    super.initState();
    if (widget.ozelTesbihat != null) {
      _ozelTesbihat = widget.ozelTesbihat.zikirBasligi;
      _tesbihatSayisi = widget.ozelTesbihat.zikirSayisi;
      _isFinished = widget.ozelTesbihat.isFinished;
      _kalanZikirSayisi=widget.ozelTesbihat.kalanZikirSayisi;
    }
  }
  Widget hadisLer(String gelenDeger) {
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
                    MaterialPageRoute(
                        builder: (context) => OzelTesbihatCounter()),
                  );
                },
                child: Text(gelenDeger,
                    style: TextStyle(fontSize: 30, color: Colors.amber[100])),
                color: myHexColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)))));
  }

  Widget buildzikirSayisi() {
    return TextFormField(
      initialValue: _tesbihatSayisi,
        validator: (value) {
          int tesbihatsayisi=int.tryParse(value);
           if (tesbihatsayisi==null||tesbihatsayisi<=0) {
          return 'sıfırdan büyük olmalı';
        }
        return null;
        },
          onSaved: (String value) {
        _tesbihatSayisi = value;
      },
          keyboardType: TextInputType.number,
          // controller: tesbihatsayisiController,
          decoration: InputDecoration(
            suffixIcon: IconButton(
                onPressed: () {
                  temizleTesbihatSayisi();
                  setState(() {
                    //tesbihatsayisiController.text = "";
                  });
                },
                icon: Icon(Icons.delete_forever)),

            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                color: Colors.brown[900],
                width: 2.0,
              ),
            ),
            labelText: 'Tesbihat Sayısını Girin', //Matrah hesaplaması için
            labelStyle: TextStyle(
                color: myFocusNode.hasFocus
                    ? Colors.brown[900]
                    : Colors.brown[900]),
            focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Colors.deepOrange[900], width: 2.0)),
          ),
          onChanged: (text) {
            setState(() {
              //_tesbihatSayisi = tesbihatsayisiController.text;
            });
          },
          
        );
  }
  Widget bisey(){
    return Container(
                child: BlocConsumer<ZikirBloc, List<Zikir>>(
          builder: (context, zikirList) {
            return ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                print("ZikirList: $zikirList");

                Zikir zikir = zikirList[index];
                return ListTile(
                    title: Text(zikir.zikirBasligi, style: TextStyle(fontSize: 30)),
                    subtitle: Text(
                      "Zikir Sayısı: ${zikir.zikirSayisi}\nBitti mi: ${zikir.isFinished}",
                      style: TextStyle(fontSize: 20),
                    ));
                    //onTap: () => show(context, zikir, index));
              },
              itemCount: zikirList.length,
              separatorBuilder: (BuildContext context, int index) => Divider(color: Colors.black),
            );
          },
          listener: (BuildContext context, zikirList) {},
        ),
              );
  }
  Widget buildZikirBasligi() {
    return TextFormField(
        initialValue: _ozelTesbihat,
        validator: (value) {
           if (value.isEmpty) {
          return 'Name is Required';
        }
        return null;
        },
          onSaved: (String value) {
        _ozelTesbihat = value;
      },
          focusNode: myFocusNode,
          // keyboardType: TextInputType.number,
          //controller: ozeltesbihatController,
          decoration: InputDecoration(
            suffixIcon: IconButton(
                onPressed: () {
                  temizleTesbihat();
                  setState(() {
                //    ozeltesbihatController.text = "";
                  });
                },
                icon: Icon(Icons.delete_forever)),
            // hintText: "An Outline Border TextField",

            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: Colors.brown[900], width: 2.0)),
            labelText: 'Tesbihatı Girin',
            labelStyle: TextStyle(
                color: myFocusNode.hasFocus
                    ? Colors.brown[900]
                    : Colors.brown[900]),

            focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Colors.deepOrange[900], width: 2.0)),
          ),

          // onChanged: (text) {
          //   setState(() {
          //     _ozelTesbihat = ozeltesbihatController.text;
          //   });
          // }
          );
        
  }
}
