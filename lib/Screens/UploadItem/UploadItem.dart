import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/components/alert.dart';
import 'package:flutter_auth/components/rounded_input_field.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:developer';

//Classe permettant d'ajouter un nouveau Item
class UploadPage extends StatefulWidget {
  UploadPage({Key key, this.url}) : super(key: key);

  final String url;

  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {


  final TextEditingController _titleController = TextEditingController();

  final TextEditingController _descriptionController = TextEditingController();

  final TextEditingController _shortDescriptionController = TextEditingController();

  final TextEditingController _EtatController = TextEditingController();

  //Méthode pour contacter le back end et ajouter un Item
  Future<http.StreamedResponse> uploadImage(filename,title,description,shortDescription,status) async {
    var req = new http.MultipartRequest("POST",Uri.parse("http://192.168.1.16:8080/item"),
    );
    req.headers['Authorization']='Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJkbmVqaSIsImV4cCI6MTY0MjEwMzY2NSwiaWF0IjoxNjQyMDg1NjY1fQ.86u8R3TlRuKxpHswF94XKu3AjaHBczMus-4j0r5-HYkAnYxVAlkjIXCoKaJ7BAzCKZ7Ai0vV7hRHU-_ZHdLHYw';
    req.files.add(await http.MultipartFile.fromPath('files', filename));
    req.fields['Title']=title;
    req.fields['description']=description;
    req.fields['shortDescription']=shortDescription;
    req.fields['itemConditionCode']=status;
    return await req.send();
  }
  String state = "";

  //Méthode de création de l'interface
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add new Item'),
      ),
      body: Center(
        child: SingleChildScrollView(
    child:Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[
            RoundedInputField(
              hintText: "Title",
              onChanged: (value) {
              this._titleController.text=value;
              },
            ),
        RoundedInputField(
          hintText: "Description",
          onChanged: (value) {
            this._descriptionController.text=value;
          }),
        RoundedInputField(
          hintText: "Short Description",
          onChanged: (value) {
            this._shortDescriptionController.text=value;
          }),
            RoundedInputField(
                hintText: "Status",
                onChanged: (value) {
                  this._EtatController.text=value;
                })
          ],
        ),
        )
      ),

      floatingActionButton: FloatingActionButton(
        //Button qui permet de choisir une image à partir du gallérie
        onPressed: () async {
          final ImagePicker _picker = ImagePicker();
          var file = await _picker.pickImage(source: ImageSource.gallery);
          //Contacter le Back End
          var res = await uploadImage(file.path,_titleController.text,_descriptionController.text,
              _shortDescriptionController.text,_EtatController.text);
          log(res.statusCode.toString());
          if(res.statusCode==200)
            {
              //En cas de succès afficher une alerte de succès
              showDialog(context: context,
                  builder: (BuildContext context) {
                    return UploadSuccessAlert();
                  });
            }
          else
            {
            //En cas d'échech afficher une alerter d'erreur
              showDialog(context: context,
                  builder: (BuildContext context) {
                    return UploadErrorAlert();
                  });
            }
        },
        child: Icon(Icons.add),
      ),

    );
  }
}