import 'package:flutter/material.dart';
import 'package:flutter_auth/Model/ItemDto.dart';
import 'package:flutter_auth/Screens/Item/ItemDetails.dart';

//Component UserTitle (Design) préparé et à importer et utiliser directement dans autres interfaces
//C'est une sorte de carte contenant des informations sur un Item.
//Importé et utilisé dans la page d'accueil.
class UserTile extends StatelessWidget {
  final ItemDto item;

  UserTile({this.item});

  String userTitle() {

    return "pc";
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          ListTile(
            leading: Hero(
              tag: Text(item.title),
              child: CircleAvatar(
                backgroundImage: MemoryImage(item.itemImage)
              ),
            ),
            title: Text(item.title),
            subtitle: Text(item.shortDescription),
            onTap: () {
          Navigator.push(
          context,
          MaterialPageRoute(
          builder: (context) => ItemDetailsPage(item:this.item)));
          },

          ),
          const SizedBox(width: 18),

          Divider(
            thickness: 2.0,
          ),
        ],

      ),

    );
  }
}