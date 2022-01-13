import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

//Component LoadingView (Design) préparé et à importer et utiliser directement dans autres interfaces

class LoadingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height*0.2,
        ),
        Container(
          child: Lottie.asset('assets/loading.json'),
        ),
        Text('Loading ...',
          style: TextStyle(
            fontSize: 16.0,
          ),),
      ],
    );
  }
}