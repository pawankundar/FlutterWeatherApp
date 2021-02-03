import 'package:http/http.dart';
import 'dart:convert';


class Netwworkhelper {

  Netwworkhelper(this.url);
  final String url;


  Future  getData()async{

    Response resp = await get(url);
    if (resp.statusCode==200){
      String data = resp.body;
      var decodedData = jsonDecode(data);
      return decodedData;
    }
    else{
      print(resp.statusCode);
    }
    }

  }
