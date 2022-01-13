import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Model/Img.dart';
import 'package:flutter_auth/Model/ItemDto.dart';
import 'package:http/http.dart' as http;
import 'dart:developer';
import 'dart:convert';

//Classe permettant d'exécuter quelques requetes vers le BackEnd
final String url = "http://192.168.1.16:8080/item/available";

List<ItemDto> parseUser(String responseBody){
  var list = json.decode(responseBody) as List<dynamic>;
  var items = List<ItemDto>();
  for(int i=0;i<list.length;i++)
    {
      items.add(ItemDto(list[i]['id'],list[i]['title'],list[i]['description'],list[i]['shortDescription'],
          Base64Codec().decode(list[i]['itemImages'][0]['data'])));

    }
  return items;
}
Future<List<ItemDto>> fetchItems() async{
  http.Response res = await http.get(
      Uri.parse("http://192.168.1.16:8080/item/available"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
      'Authorization': 'Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJkbmVqaSIsImV4cCI6MTY0MjEwMzY2NSwiaWF0IjoxNjQyMDg1NjY1fQ.86u8R3TlRuKxpHswF94XKu3AjaHBczMus-4j0r5-HYkAnYxVAlkjIXCoKaJ7BAzCKZ7Ai0vV7hRHU-_ZHdLHYw',
      }
  );
  if (res.statusCode == 200) {
    return compute(parseUser,res.body);
  } else {
    throw Exception(res.statusCode);
  }
}