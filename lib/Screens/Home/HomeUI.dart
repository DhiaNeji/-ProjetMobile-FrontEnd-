import 'package:flutter/material.dart';
import 'package:flutter_auth/Domain/repository.dart';
import 'package:flutter_auth/Model/ItemDto.dart';
import 'package:flutter_auth/Screens/UploadItem/UploadItem.dart';
import 'package:flutter_auth/components/Item_Title.dart';
import 'package:flutter_auth/components/loading_widget.dart';
import 'dart:developer';

import 'package:flutter_auth/components/rounded_button.dart';

//Interface page d'accueil contenant la liste des items disponibles pour l'échange
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ItemDto> _users = <ItemDto>[];
  //Liste contenant les items de type ITEMSDTO récupérées du back end
  List<ItemDto> _usersDisplay = <ItemDto>[];

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchItems().then((value) {
      log(value.toString());
      setState(() {
        _isLoading = false;
        _users.addAll(value);
        _usersDisplay = _users;
        print(_usersDisplay.length);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Items List'),
        backgroundColor: Color(0xFF6200EE)
      ),
      body: SafeArea(
        child: SingleChildScrollView(
        child:new Column(
          children:[
            Container(
              height: 500.0,
              width: 500.0,
              child:
              ListView.builder(
                itemBuilder: (context, index) {
                  if (!_isLoading) {
                    return index == 0 ? _searchBar() : UserTile(item: this._usersDisplay[index -1]);
                  } else {
                    //Si le back end n'a pas encore répondu, afficher le component de Loading
                    return LoadingView();
                  }
                },
                itemCount: _usersDisplay.length + 1,
              ),
            ),
            RoundedButton(
              color:Color(0xFF6200EE),
              text: "Add new Item",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    //Bouton faisant la rédirection vers la page d'ajout d'un nouvel Item
                    builder: (context) {
                      return UploadPage();
                    },
                  ),
                );
              },
            )
          ]
        )
        )
      ),
    );
  }
//Barre de recherche
  _searchBar() {
    return Padding(
      padding: EdgeInsets.all(12.0),
      child: TextField(
        autofocus: false,
        onChanged: (searchText) {
          searchText = searchText.toLowerCase();
          setState(() {
            _usersDisplay = _users.where((u) {
              var ftitle = u.title.toLowerCase();
              return ftitle.contains(searchText);
            }).toList();
          });
        },
        // controller: _textController,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.search),
          hintText: 'Search Items',
        ),
      ),
    );
  }
}