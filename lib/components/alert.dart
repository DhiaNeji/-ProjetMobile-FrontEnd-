import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Home/HomeUI.dart';

//Component des alerte (Design) préparé et à importer et utiliser directement dans autres interfaces
//Il s'agit de plusieurs alertes à utiliser selon le besoin (Success, Error...)
class AdvanceCustomAlert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0)
        ),
        child: Stack(
          overflow: Overflow.visible,
          alignment: Alignment.topCenter,
          children: [
            Container(
              height: 200,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 70, 10, 10),
                child: Column(
                  children: [
                    Text('Warning !', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                    SizedBox(height: 5,),
                    Text('Please verify your credentials', style: TextStyle(fontSize: 15),),
                    SizedBox(height: 20,),
                    MaterialButton(onPressed: () {
                      Navigator.of(context).pop();
                    },
                      color: Colors.orange,
                      child: Text('Okay', style: TextStyle(color: Colors.white),),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
                top: -60,
                child: CircleAvatar(
                  backgroundColor: Colors.orange,
                  radius: 60,
                  child: Icon(Icons.error, color: Colors.white, size: 50,),
                )
            ),
          ],
        )
    );
  }
}
class AdvanceCustomSuccessAlert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0)
        ),
        child: Stack(
          overflow: Overflow.visible,
          alignment: Alignment.topCenter,
          children: [
            Container(
              height: 200,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 70, 10, 10),
                child: Column(
                  children: [
                    Text('Info', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                    SizedBox(height: 5,),
                    Text('Account created successfully', style: TextStyle(fontSize: 15),),
                    SizedBox(height: 20,),
                    MaterialButton(onPressed: () {
                      Navigator.of(context).pop();
                    },
                      color: Colors.green,
                      child: Text('Okay', style: TextStyle(color: Colors.white),),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
                top: -60,
                child: CircleAvatar(
                  backgroundColor: Colors.green,
                  radius: 60,
                  child: Icon(Icons.done, color: Colors.white, size: 50,),
                )
            ),
          ],
        )
    );
  }
}
class TradeSuccessAlert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0)
        ),
        child: Stack(
          overflow: Overflow.visible,
          alignment: Alignment.topCenter,
          children: [
            Container(
              height: 250,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 70, 10, 10),
                child: Column(
                  children: [
                    Text('Info', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                    SizedBox(height: 5,),
                    Text('Trade has been created, an email has been sent to the owner to inform him !', style: TextStyle(fontSize: 15),),
                    SizedBox(height: 20,),
                    MaterialButton(onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return HomePage();
                          },
                        ),
                      );
                    },
                      color: Colors.green,
                      child: Text('Okay', style: TextStyle(color: Colors.white),),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
                top: -60,
                child: CircleAvatar(
                  backgroundColor: Colors.green,
                  radius: 60,
                  child: Icon(Icons.done, color: Colors.white, size: 50,),
                )
            ),
          ],
        )
    );
  }
}
class UploadErrorAlert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0)
        ),
        child: Stack(
          overflow: Overflow.visible,
          alignment: Alignment.topCenter,
          children: [
            Container(
              height: 250,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 70, 10, 10),
                child: Column(
                  children: [
                    Text('Error', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                    SizedBox(height: 5,),
                    Text('An error has occured during uploading your item', style: TextStyle(fontSize: 15),),
                    SizedBox(height: 20,),
                    MaterialButton(onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return HomePage();
                          },
                        ),
                      );
                    },
                      color: Colors.orange,
                      child: Text('Okay', style: TextStyle(color: Colors.white),),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
                top: -60,
                child: CircleAvatar(
                  backgroundColor: Colors.orange,
                  radius: 60,
                  child: Icon(Icons.error, color: Colors.white, size: 50,),
                )
            ),
          ],
        )
    );
  }
}
class UploadSuccessAlert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0)
        ),
        child: Stack(
          overflow: Overflow.visible,
          alignment: Alignment.topCenter,
          children: [
            Container(
              height: 250,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 70, 10, 10),
                child: Column(
                  children: [
                    Text('Info', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                    SizedBox(height: 5,),
                    Text('Uploaded successfully', style: TextStyle(fontSize: 15),),
                    SizedBox(height: 20,),
                    MaterialButton(onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return HomePage();
                          },
                        ),
                      );
                    },
                      color: Colors.green,
                      child: Text('Okay', style: TextStyle(color: Colors.white),),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
                top: -60,
                child: CircleAvatar(
                  backgroundColor: Colors.green,
                  radius: 60,
                  child: Icon(Icons.done, color: Colors.white, size: 50,),
                )
            ),
          ],
        )
    );
  }
}