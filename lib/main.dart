
import 'package:tesbihat/pages/home.dart';
import 'package:tesbihat/pages/loading.dart';
import 'package:tesbihat/pages/ozelTesbihat.dart';
import 'package:flutter/material.dart';
import 'package:tesbihat/pages/namaztesbihatı.dart';

void main() => runApp(MaterialApp(
  initialRoute:"/",
  routes: {
    "/":(context)=>Home(),
    "/loading":(context)=>LoadingScreen(),
    "/namazTesbihatı":(context)=>NamazTesbihati(),
    "/ozelTesbihatı":(context)=>OzelTesbihat(),
  },
));