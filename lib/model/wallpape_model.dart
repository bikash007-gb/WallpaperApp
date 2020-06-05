class Wallpapermode{
  String photographer;
  String photographer_url;
  int photographer_id;
  Srcmodel src;
  Wallpapermode({this.photographer,this.photographer_id,this.photographer_url,this.src});

  //to get the json data
  factory Wallpapermode.fromMap(Map<String,dynamic> jsonData){
      return Wallpapermode(
        src: Srcmodel.fromMap(jsonData['src']),          
         photographer_url:jsonData[' photographer_url'],
         photographer_id:jsonData[' photographer_id'],
         photographer: jsonData['photographer']
      );
  }
}

class Srcmodel{
  String original;
  String small;
  String portrait;
  Srcmodel({this.original,this.portrait,this.small});

   factory Srcmodel.fromMap(Map<String,dynamic> jsonData){
     return Srcmodel(
          portrait: jsonData['portrait'],
          small:jsonData['small'],
          original:jsonData['original']
     );
   }
}