import 'package:flutter/material.dart';
import './views/home.dart';
void main(){
  runApp(
    new MaterialApp(
      title: 'WallPaper',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        brightness: Brightness.dark,
      ),
      home: Home(),
    )
  );
}