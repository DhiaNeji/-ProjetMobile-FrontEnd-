import 'dart:typed_data';

import 'package:flutter_auth/Model/Img.dart';
import 'dart:developer';

//Classe ItemDTO qui est notre modèle
class ItemDto {
  int id;
  String title ="";
  String description ="";
  String shortDescription ="";
  Uint8List itemImage;

  ItemDto(this.id, this.title, this.description, this.shortDescription,this.itemImage);

  ItemDto.fromJson(Map<String, dynamic> json) {
    log(json['id']);
    id = json['id'];
    title = json['title'];
    description = json['description'];
    shortDescription = json['shortDescription'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['shortDescription'] = this.shortDescription;
    data['itemImages']=this.itemImage;
    return data;
  }
}
