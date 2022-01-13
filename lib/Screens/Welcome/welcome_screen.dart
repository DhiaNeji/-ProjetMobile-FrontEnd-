import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Welcome/components/body.dart';

//Widget de Welcome qui fait appel aux components BACKGROUND et Body
class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
