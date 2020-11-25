import 'dart:async';
import 'dart:developer';

import 'package:game_sales/bloc/blocprovider.dart';
import 'package:game_sales/data/api.dart';
import 'package:game_sales/event/apievent.dart';
import 'package:game_sales/model/Game.dart';
import 'package:rxdart/rxdart.dart';

class ApiBloc implements BlocBase{

  List<Game> gamelist = [];
  BehaviorSubject<List<Game>> _subjectlist;
  bool testapi;



  /*final _eventcontroller = StreamController<ApiEvent>.broadcast();
  final _postcontroller = StreamController<List<Game>>.broadcast();

  StreamSink<List<Game>> get _inGames => _postcontroller.sink;
  Stream<List<Game>> get items => _postcontroller.stream;*/

  /*ApiBloc(){
    getGames();
    _eventcontroller.stream.listen(_listener);
  }*/

  Stream<List<Game>> get observablelist => _subjectlist.stream;

  ApiBloc(){
    _subjectlist = new BehaviorSubject<List<Game>>.seeded(this.gamelist);
  }

  void getGames2() async{
    List<Game> games = await Api.api.getGames();
    _subjectlist.sink.add(games);
    if(games.isEmpty || games == null){
      testapi=false;
    }else{
      testapi=true;
    }
  }



  /*void dispatch(ApiEvent event){
    _eventcontroller.add(event);
  }*/

  /*void _listener(ApiEvent event){
    if(event is GetGames){
      getGames();
    }
  }

  Future<List<Game>> getGames() async{
    List<Game> games = await Api.api.getGames();
    _inGames.add(games);
    return games;
  }*/



  @override
  void dispose() {
    //_eventcontroller.close();
    //_eventcontroller.close();
  }

}
