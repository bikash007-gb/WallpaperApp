import 'dart:convert';
import 'dart:ffi';

import 'package:WallPaper/image_view.dart';
import 'package:WallPaper/model/catagories_model.dart';
import 'package:WallPaper/model/data.dart';
import 'package:WallPaper/model/wallpape_model.dart';
import 'package:WallPaper/views/category.dart';
import 'package:WallPaper/views/search.dart';
import 'package:WallPaper/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Categoriesmodel> categorie=new List();
  List<Wallpapermode> wallpapers=new List();
  TextEditingController serarcheditingcontroller=new TextEditingController();
  int noOfImageToLoad = 60;
  
  grtTrending() async{

    var response=await http.get("https://api.pexels.com/v1/curated?per_page=$noOfImageToLoad&page=1",
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
    grtTrending();
    categorie=getCategories();
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
                            onTap: (){Navigator.push(context, MaterialPageRoute(
                              builder: (context)=>Search(
                               searchQuerry: serarcheditingcontroller.text,
                              )
                              ));
                            },
                            child: Icon(
                           Icons.search,
                           color: Colors.white,
                           ),
                       )               
                     ],
                 ),
               ),
              SizedBox(height: 16,),
              Container(
                height: 70,
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  itemCount: categorie.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder:(context , index){
                    return CategoriesTile(
                        title: categorie[index].categoriesname,
                        imgurl: categorie[index].imgurl,
                    );
                  }),
              ),
               wallpaperview(wallpapers, context)
            ],
          )
        ),
      )
      
    );
  }
}
class CategoriesTile extends StatelessWidget {
  final String imgurl,title;
  CategoriesTile({this.imgurl,this.title});
  @override
  Widget build(BuildContext context) {
    return InkWell(
         onTap: (){
           Navigator.push(context, MaterialPageRoute(
                              builder: (context)=>Categories(
                               categoryQuerry: title.toLowerCase(),
                              )
                              ));
         },
          child: Container(
        margin: EdgeInsets.only(right:7),
        child: Stack(

          children: <Widget>[
             ClipRRect(
              borderRadius: BorderRadius.circular(10),
              
              child: Image.network(imgurl,height: 50,width: 100,fit: BoxFit.cover,)
              ),
            
            Container(
             decoration: BoxDecoration(
               color:Colors.black12,
               borderRadius: BorderRadius.circular(10)
             ),
              height: 50,width: 100,
              alignment: Alignment.center,
              child:Text(title,style: TextStyle(color:Colors.white,fontWeight: FontWeight.w400),)
            )
          ],
        ),
      ),
    );
  }
}