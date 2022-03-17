import 'package:flutter/material.dart';
import 'package:task_5/widgets/Pokemon_container.dart';

import '../news_model/Pokemon_model.dart';



// ignore: must_be_immutable
class PokemonRow extends StatelessWidget {

  final int index;
  final dynamic data1 ;
  final dynamic data2 ;

  PokemonRow(this.index, this.data1, this.data2, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: PokemonContainer(index, data1)),
        Expanded(child: PokemonContainer(index+1, data2)),
      ]

    );
  }
}
