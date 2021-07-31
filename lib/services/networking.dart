
import 'package:http/http.dart';
import 'dart:convert';
class Netwoekhelper{
  Netwoekhelper(this.url);
  final String url;

  Future getData()async{
     Response res=await get(url);
    if(res.statusCode==200){
    String data=res.body;

   return jsonDecode(data);
    }
    else{
      print(res.statusCode); 
    }
  }
}