import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_5/screens/home.dart';
import 'package:task_5/news_model/Pokemon_api.dart';

class splash_screen extends StatefulWidget {
  const splash_screen({Key? key}) : super(key: key);

  @override
  State<splash_screen> createState() => _splash_screensState();
}



class _splash_screensState extends State<splash_screen> {

  late StreamController _streamController;
  late Stream _stream;
  late NewsApi _newsApi;

  void initState(){
    super.initState();
    _streamController= StreamController();  //initialize controller
    _stream = _streamController.stream;  //bind the controller to the stream
    _newsApi= NewsApi();  //initialize the NewsApi class
    _navigatetohome();
  }

  _navigatetohome() async{
    var response = await _newsApi.getNews();  // the returned list from getNews function
    _streamController.add(response);  // add the whole list to the stream
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home(this._streamController, this._stream, this._newsApi)));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Image.asset("pokemon.png") ,

          ],
          // image:
            )
      // Container(
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     fit: BoxFit.fill,
        //     // Background   Color
        //     // 5.jpg        Color.fromRGBO(255, 220, 14, 1.0)
        //     // 4.jpg        Colors.amberAccent
        //
        //     image: AssetImage("1.jpg"),
        //   ),
        // ),
      // ),
      )
    );
  }


}
