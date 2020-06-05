import 'dart:io';
import 'dart:typed_data';


import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';

class Imageview extends StatefulWidget {
  final String imgurl;
  
  Imageview({this.imgurl});
  @override
  _ImageviewState createState() => _ImageviewState();
}

class _ImageviewState extends State<Imageview> {
var filepath;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[

          Hero(
            tag: widget.imgurl,
              child: Container(
              height:MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.network(widget.imgurl,fit:BoxFit.cover)),
          ),
          Container(
              height:MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.symmetric(horizontal: 75),
              child:Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  GestureDetector(
                    onTap: (){
                      _save();
                    },
                      child: Stack(
                      children: <Widget>[
                        Container(
                         width: MediaQuery.of(context).size.width/2,
                         color: Color(0xff1C1B1B).withOpacity(0.8),
                        ),
                        Container(
                      width: MediaQuery.of(context).size.width/2,
                      padding: EdgeInsets.symmetric(horizontal: 8,vertical: 8),
                      decoration: BoxDecoration(
          border:Border.all(color:Colors.white),
          borderRadius: BorderRadius.circular(24),
          gradient: LinearGradient(
           colors: [
             Color(0x36FFFFFF),
            Color(0x0FFFFFFF)
            ] 
          )
                      ),
                    child: Column(
                      children: <Widget>[
          Text('Download Now',style: TextStyle(color:Colors.white,fontSize: 22),),
                      ],
                    ),
                    ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16,),
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Text('Cancel',style:TextStyle(color:Colors.white,fontSize: 20))),
                 
                  SizedBox(height:50)
                ],
              )
            )
         
      
        ],
         ),
        
    );
  }
  
  _save() async {
    await _askPermission();
    var response = await Dio().get(widget.imgurl,
        options: Options(responseType: ResponseType.bytes));
    final result =
        await ImageGallerySaver.saveImage(Uint8List.fromList(response.data));
    print(result);
    Navigator.pop(context);
  }

  _askPermission() async {
    if (Platform.isIOS) {
      /*Map<PermissionGroup, PermissionStatus> permissions =
          */await PermissionHandler()
              .requestPermissions([PermissionGroup.photos]);
    } else {
     /* PermissionStatus permission = */await PermissionHandler()
          .checkPermissionStatus(PermissionGroup.storage);
    }
  }

  
}