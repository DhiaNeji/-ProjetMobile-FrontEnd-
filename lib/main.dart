import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Welcome/welcome_screen.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //On va utiliser le material design
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      //Nom de l'application
      title: 'Trade IT',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor:const Color(0xFFEEEEEE),
      ),
      home: WelcomeScreen(),
    );
  }
}
