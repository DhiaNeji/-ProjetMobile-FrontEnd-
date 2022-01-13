import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:flutter_auth/Screens/Signup/components/background.dart';
import 'package:flutter_auth/Screens/Signup/components/or_divider.dart';
import 'package:flutter_auth/Screens/Signup/components/social_icon.dart';
import 'package:flutter_auth/components/alert.dart';
import 'package:flutter_auth/components/already_have_an_account_acheck.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/components/rounded_input_field.dart';
import 'package:flutter_auth/components/rounded_password_field.dart';
import 'dart:developer';
import 'package:http/http.dart' as http;
import '../../../constants.dart';
import 'dart:convert';


//Body de l'interface SignUp
class Body extends StatelessWidget {

  //Contacter le Back End pour enregistrer un nouvel utilisateur
  Future<http.StreamedResponse> attemptSignUp(String username, String password,String email) async {
    var map = new Map<String, dynamic>();
    map["username"]=username;
    map["password"]=password;
    map["email"]=email;
    var res = new http.MultipartRequest("POST",Uri.parse("http://192.168.1.16:8080/user/signup"));
    res.fields['fullName']=username;
    res.fields['email']=email;
    res.fields['password']=password;
    return await res.send();
  }

  //Méthode pour afficher une alerte
  void displayDialog(context, title, text) => showDialog(
    context: context,
    builder: (context) =>
        AlertDialog(
            title: Text(title),
            content: Text(text)
        ),
  );

  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            SizedBox(height: size.height * 0.13),
            Text(
              "Welcome On Board",
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),
            ),
            SizedBox(height: size.height * 0.03),
            Text(
              "Let's help you meet your tasks",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Full name",
              onChanged: (value) {
                _usernameController.text=value;
              },
            ),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {
                _emailController.text=value;
              },
            ),
            RoundedPasswordField(
              onChanged: (value) {
                _passwordController.text=value;
              },
            ),
            RoundedButton(
              color: const Color(0xFF50C2C9),
              text: "SIGNUP",
              press: () async {
                var username = _usernameController.text;
                var password = _passwordController.text;
                var email = _emailController.text;
                //On Click sur cette bouton, on contacte le BackEnd
                var res = await attemptSignUp(username, password, email);
                if(res.statusCode==200)
                  {
                    //En cas de succès, afficher une alerte de succès
                    showDialog(context: context,
                        builder: (BuildContext context) {
                          return AdvanceCustomSuccessAlert();
                        });
                  }
                else
                  {
                    //En cas d'échec, afficher une alerte d'échec
                    showDialog(context: context,
                        builder: (BuildContext context) {
                          return AdvanceCustomAlert();
                        });
                  }
              }
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              //Si user possède un compte, on le rédirige vers l'interface Login
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            OrDivider(),
          ],
        ),
      ),
    );
  }
}
