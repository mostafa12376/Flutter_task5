import 'dart:async';
import 'package:flutter/material.dart';
import 'package:task_5/screens/splash_screen.dart';
import '../news_model/Pokemon_api.dart';
import '../widgets/Pokemon_row.dart';


class Home extends StatefulWidget {
  late StreamController _streamController;
  late Stream _stream;
  late NewsApi _newsApi;
  Home(this._streamController, this._stream, this._newsApi);
  @override
  _HomeState createState() => _HomeState(this._streamController, this._stream, this._newsApi);
}

class _HomeState extends State<Home> {


  late StreamController _streamController;
  late Stream _stream;
  late NewsApi _newsApi;

  _HomeState(this._streamController, this._stream, this._newsApi);

  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(245, 245, 245, 1),
        appBar: AppBar(title:const Center(
        child:Text('Poke App',style: TextStyle(fontSize: 30.0),)), backgroundColor: Colors.cyan,),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.cyan,
          child: const Icon(Icons.refresh,),
          onPressed: (){
            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (context)=>splash_screen())).then((value) => setState((){}));
          },
        ),
        body: Center(
          child: StreamBuilder(  //a widget that updates itself when the stream is updated
            stream: _stream,
              builder: (context,snapshot){
                if(snapshot.hasData) {  //make sure that there is data inside the stream
                  var myData = snapshot.data as Map;
                  int num= (myData['pokemon'].length/2).toInt();
                  return ListView.builder(//convert list to map
                    itemCount: (num),
                    itemBuilder: (context, i) =>
                    PokemonRow(
                          i*2,
                          myData['pokemon'][i*2],
                          myData['pokemon'][i*2+1],
                        ),

                  );
                }
                return const CircularProgressIndicator(); //in case the data hasn't yet being added to the stream show this widget
              }
          ),
        ),
      ),
    );
  }
}


