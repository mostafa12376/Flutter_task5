import 'package:flutter/material.dart';
import '../news_model/Pokemon_model.dart';

// ignore: must_be_immutable
class PokemonContainer extends StatelessWidget {
  final int index;
  final dynamic data;
  late Pokemon _pokemon;

  PokemonContainer(this.index, this.data, {Key? key}) : super(key: key) {
    _pokemon = Pokemon(data['img'], data['name']);
  }

  @override
  Widget build(BuildContext context) {

    return Padding(
        padding: EdgeInsets.all(10),
        child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
                // border: Border.all(),
                color: Colors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: FadeInImage(
                    image: NetworkImage(_pokemon.img), //NetworkImage(),
                    placeholder: AssetImage("pokemon.png"),
                    height: 120,
                    width: 120,
                    imageErrorBuilder:
                        (context, error, stackTrace) {
                      return Image.network(_pokemon.img
                      , errorBuilder:
                              (context, exception, stackTrace) {
                        return Image.network(_pokemon.img, errorBuilder:
                            (context, exception, stackTrace) {
                          return Image.network(_pokemon.img, errorBuilder:
                              (context, exception, stackTrace) {
                            return Image.network(_pokemon.img, errorBuilder:
                                (context, exception, stackTrace) {
                              return Image.network("pokemon.png");
                            },
                              height: 120,
                              width: 120,);
                          },
                            height: 120,
                            width: 120,);
                        },
                          height: 120,
                          width: 120,);
                      },
                        height: 120,
                        width: 120,
                      );
                      // return Image.asset(
                      //     'pokemon.png',
                      //   height: 120,
                      //   width: 120,);
                    },
                    // imageErrorBuilder:  Image.asset('Your error widget...')
                  ),
                ), //_pokemon.img
                Center(
                    child: Text(
                  _pokemon.name, //_pokemon.name
                  style: const TextStyle(
                    fontSize: 25.0,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ))
              ],
            )));
  }
}
