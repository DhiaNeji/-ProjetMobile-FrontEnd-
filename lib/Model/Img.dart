import 'dart:typed_data';

//Classe ItemImage qui est l'image d'un tel Item
class ItemImage
{
  int id;

  String name;

  String contentType;

  int size;

  ByteData data;

  ItemImage(this.id, this.name, this.contentType, this.data);

  ItemImage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    contentType = json['contentType'];
    size = json['size'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['contentType'] = this.contentType;
    data['size'] = this.size;
    data['data'] = this.data;
    return data;
  }
}