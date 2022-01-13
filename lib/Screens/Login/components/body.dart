import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Home/HomeUI.dart';
import 'package:flutter_auth/Screens/Login/components/background.dart';
import 'package:flutter_auth/Screens/Signup/signup_screen.dart';
import 'package:flutter_auth/components/alert.dart';
import 'package:flutter_auth/components/already_have_an_account_acheck.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/components/rounded_input_field.dart';
import 'package:flutter_auth/components/rounded_password_field.dart';
import 'dart:developer';
import 'package:http/http.dart' as http;

import '../../../constants.dart';

class Body extends StatelessWidget {

   Body({
    Key key,

}) : super(key: key);


   //Méthode d'affichage d'une alerte
  void displayDialog(context, title, text) => showDialog(
    context: context,
    builder: (context) =>
        AlertDialog(
            title: Text(title),
            content: Text(text)
        ),
  );
  //Méthode pour contacter le BackEnd et essayer de faire le Login
  Future<String> attemptLogIn(String username, String password) async {
    http.Response res = await http.post(
        Uri.parse("http://192.168.1.16:8080/user/signin"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
            { "username": username,
              "password": password
            })
    );
    if(res.statusCode == 200) return res.body.toString();
    return null;
  }
   final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.08),
            Text(
              "Welcome Back Trader",
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),
            ),
            SizedBox(height: size.height * 0.03),
            Image.asset(
              "assets/images/img_2.png",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Your Username",
              onChanged: (value) {
               _usernameController.text=value;
              },
            ),
            RoundedPasswordField(
              onChanged: (value) {
                _passwordController.text=value;
              },
            ),
            RoundedButton(
              text: "LOGIN",
              color:Color(0xFF50C2C9),
              press: () async{
              var username=_usernameController.text;
              var password=_passwordController.text;
              String jwt=await attemptLogIn(username, password);
              log(jwt.toString());
              if(jwt!=null)
                {
                  //OnClick Contacter le BackEnd pour le Login et en cas de succès, faire une rédirection vers la page d'accueil
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return HomePage();
                      },
                    ),
                  );
                }
              else
                {
                  //En cas d'erreur de login, afficher une alerte d'échec
                  showDialog(context: context,
                      builder: (BuildContext context) {
                        return AdvanceCustomAlert();
                      });
                }
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
