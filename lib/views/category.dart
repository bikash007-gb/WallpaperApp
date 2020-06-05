import 'dart:convert';

import 'package:WallPaper/model/data.dart';
import 'package:WallPaper/model/wallpape_model.dart';
import 'package:WallPaper/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Categories extends StatefulWidget {
  final String categoryQuerry;
  Categories({this.categoryQuerry});
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<Wallpapermode> wallpapers=new List();
   
   getcategory(String querry) async{
    
    var response=await http.get("https://api.pexels.com/v1/search?query=$querry&per_page=60&page=1",
    headers:{
      "Authorization":apiKey
    } );
    Map<String,dynamic> jsonData=jsonDecode(response.body);
    jsonData['photos'].forEach((element){
      Wallpapermode wallpapermode=new Wallpapermode();
      wallpapermode=Wallpapermode.fromMap(element);
      wallpapers.add(wallpapermode);
    });
    setState(() {});
  }

  @override
  void initState() {
     getcategory(widget.categoryQuerry);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: brandname(),
        elevation: 0.0,
        centerTitle: true,
      ),
    body: SingleChildScrollView(
      child: wallpaperview(wallpapers, context),
    ),
    );
      

  }
}