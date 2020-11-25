import 'dart:convert';
import 'dart:developer';
import 'package:game_sales/model/Game.dart';
import 'package:http/http.dart' as http;
class Api{

  //singleton
  Api._();

  String url = "https://www.cheapshark.com/api/1.0/deals";
  static final Api api = Api._();
  bool apitest;


  Future<List<Game>> getGames() async{
    final response = await http.get(url);
    if(response.statusCode==200){
      apitest=true;
      List<dynamic> body = json.decode(response.body) as List;
      List<Game> games=[];
      for(var item in body){
        games.add(Game.fromJson(item));
        //games.add(Game(title: item['title'],saving: item['savings'],thumb: item['thumb'],salePrice: item['salePrice'],normalPrice: item['normalPrice'],lastchange: item['lastChange']));
      }
      //games = new List<Game>.from(body);
      //var games = (body as List).map((e) => Game.fromJson(e)).toList();
      return games;
    }else{
      apitest=false;
    }

    //log(list.toString());
    //return list.map<Game>((model) => Game.fromJson(model)).toList();
  }
}