import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/diagnostics.dart';
import 'package:game_sales/bloc/apibloc.dart';
import 'package:game_sales/bloc/blocprovider.dart';
import 'package:game_sales/model/Game.dart';
import 'package:game_sales/ui/detailgame.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading/indicator/ball_beat_indicator.dart';
import 'package:loading/loading.dart';

class listgames extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Sales",
      home: BlocProvider(
        child: _listgames(),
        bloc: ApiBloc(),
      ),
    );
    //throw UnimplementedError();
  }

}

class _listgames extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return listgamesstate();
    //throw UnimplementedError();
  }

}

class listgamesstate extends State<_listgames>{

  ApiBloc bloc;
  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of<ApiBloc>(context);
    bloc.getGames2();
    return Scaffold(
      appBar: AppBar(title: Text("İndirimli Oyunlar"),),
      body: StreamBuilder(
        stream: bloc.observablelist,
        builder: (BuildContext context, AsyncSnapshot<List<Game>> data){
          if(data.hasData && data!=[]){
            var list = data.data;
            //log(list.toString());
            return ListView.builder(
                itemCount: list.length,
                itemBuilder: (BuildContext context,int index){
                  return ListTile(
                    onTap: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context) => DetailGame(game: list[index]) ));
                    },
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      children: [
                        GestureDetector(child: Image.network(list[index].thumb,width: 80,height: 50,fit: BoxFit.fill,),),
                        SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(list[index].title,overflow: TextOverflow.ellipsis,style: GoogleFonts.lato(textStyle: TextStyle(fontWeight: FontWeight.w800)),),
                            SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(list[index].normalPrice+"\$", style: GoogleFonts.lato(textStyle: TextStyle(decoration: TextDecoration.lineThrough,color: Colors.grey)),),
                                Text(list[index].salePrice+"\$", style: GoogleFonts.lato(textStyle: TextStyle()),),
                                SizedBox(height: 10,width: 20,),
                                DecoratedBox(decoration: BoxDecoration( color: Colors.lightGreen),child: Text("%"+double.parse(list[index].saving).toStringAsFixed(2), style: GoogleFonts.lato() ),),
                              ],
                            )
                        ])
                      ],
                    ),
                  );
                }
            );
          }else{
            return Loading( indicator: BallBeatIndicator(),size: 50.0,color: Colors.blue,);
          }

        },
      ),
    );
    //throw UnimplementedError();
  }

}