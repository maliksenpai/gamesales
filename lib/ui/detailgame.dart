import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game_sales/model/Game.dart';
import 'package:intl/intl.dart';

class DetailGame extends StatelessWidget{

  Game game;
  DetailGame({Key key,@required Game this.game}): super(key:key);

  @override
  Widget build(BuildContext context) {
    var date = DateTime.fromMillisecondsSinceEpoch(game.lastchange*1000);
    var formatteddate = DateFormat.yMMMMd().format(date);
    return Scaffold(
      appBar: AppBar(title: Text("Detaylar"),),
      body: Center(
        child: Text(game.title+" oyunun indirimi "+formatteddate+" tarihine kadar sürecek!"),
      ),
    );
    //throw UnimplementedError();
  }

}