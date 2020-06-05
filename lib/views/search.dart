import 'dart:convert';

import 'package:WallPaper/model/data.dart';
import 'package:WallPaper/model/wallpape_model.dart';
import 'package:WallPaper/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class Search extends StatefulWidget {
  final String searchQuerry;
  Search({this.searchQuerry});
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
   List<Wallpapermode> wallpapers=new List();
  TextEditingController serarcheditingcontroller=new TextEditingController();
  grtSeached(String querry) async{

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
    grtSeached(widget.searchQuerry);
    super.initState();
    serarcheditingcontroller.text=widget.searchQuerry;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: brandname(),
        elevation: 0.0,
        centerTitle: true,
      ),
      body:SingleChildScrollView(
              child: Container(
          child:Column(
            children: <Widget>[
               Container(
                 margin: EdgeInsets.symmetric(horizontal: 24),
                 padding: EdgeInsets.symmetric(horizontal: 20),
                 decoration: BoxDecoration(
                   color: Colors.black,
                   borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white)
                   ),
                 child: Row(
                   children: <Widget>[
                     Expanded(
                       child: TextField(
                         controller: serarcheditingcontroller,
                         style: TextStyle(color: Colors.white),
                         decoration: InputDecoration(                 
                           hintText: 'search',
                           hintStyle: TextStyle(color: Colors.white)
                         ),
                       )
                       ),

                       InkWell(
                            onTap: (){
                             grtSeached(serarcheditingcontroller.text);
                            },
                            child: Icon(
                           Icons.search,
                           color: Colors.white,
                           ),
                       )               
                     ],
                 ),
               ),
               SizedBox(
                 height: 20,
               ),
             wallpaperview(wallpapers, context)
            ],
          )
        ),
      )
    );
  }
}