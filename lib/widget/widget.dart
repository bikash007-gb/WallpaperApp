import 'dart:ui';

import 'package:WallPaper/image_view.dart';
import 'package:WallPaper/model/wallpape_model.dart';
import 'package:flutter/material.dart';
Widget brandname(){
  return RichText(
    text: TextSpan(
       style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
       children:<TextSpan>[
         TextSpan(text:"Your",style:TextStyle(color:Colors.white)),
         TextSpan(text:"Wallpapers",style:TextStyle(color:Colors.blue)),
       ] 
    )
    );
}

Widget wallpaperview(List<Wallpapermode> wallpapers,context){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: GridView.count(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 0.6,
      mainAxisSpacing: 6.0,
      crossAxisSpacing: 8.0,
      children: wallpapers.map((wallpaper){
        return GridTile(
          child: GestureDetector(
                   onTap: (){
           Navigator.push(context, MaterialPageRoute(
                              builder: (context)=>Imageview(
                               imgurl: wallpaper.src.portrait,
                              )
                              ));
         },
                      child: Hero(
              tag:wallpaper.src.portrait ,
                        child: Container(
                child:ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(wallpaper.src.portrait,fit: BoxFit.cover,))
              ),
            ),
          )
          );
      } ).toList(),
      ),
  );

}