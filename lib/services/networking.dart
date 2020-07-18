import 'dart:convert';

import 'package:http/http.dart';

class Networkhelper{
  final url;
  Networkhelper(this.url);
  Future GetData() async
  {
    Response response=await get(url);
    if(response.statusCode==200)
      {
        return jsonDecode(response.body);
      }else{
      print(response.statusCode);
    }

  }
}