import 'dart:ffi';

class Game{

  String title;
  String salePrice;
  String normalPrice;
  String saving;
  String thumb;
  int lastchange;

  /*String internalname;
  String critlink;
  int dealid;
  int storeid;
  int gameid;
  int isonsale;
  int metascore;
  String steamratingtext;
  Float steamratingpercent;
  Float steamratingcount;
  int steamappid;
  int releasedate;
  Float dealrating;*/

  //Game({this.title,this.salePrice,this.normalPrice,this.saving,this.thumb ,this.internalname,this.gameid, this.critlink,this.dealid,this.dealrating,this.isonsale,this.lastchange,this.metascore,this.releasedate,this.steamappid,this.steamratingcount,this.steamratingpercent,this.steamratingtext,this.storeid});

  Game({this.title,this.saving,this.thumb,this.salePrice,this.normalPrice,this.lastchange});

  /*factory Game.fromJson(Map<String,dynamic> json){
    title : json['title'];
  }*/

  factory Game.fromJson(Map<String, dynamic>json){
    return Game(
      title : json['title'],
      saving : json['savings'],
      thumb : json['thumb'],
      salePrice : json['salePrice'],
      normalPrice : json['normalPrice'],
      lastchange : json['lastChange']
    );
  }

  /*factory Game.fromJson(Map<String,dynamic> json){
    internalname : json['internalName'];
    title : json['title'];
    salePrice : json['salePrice'];
    normalPrice : json['normalPrice'];
    saving : json['savings'];
    thumb : json['thumb'];
    critlink : json['metacriticLink'];
    dealid : json['dealID'];
    storeid : json['storeID'];
    gameid : json['gameID'];
    salePrice : json['salePrice'];
    normalPrice : json['normalPrice'];
    isonsale : json['isOnSale'];
    metascore : json['metacriticScore'];
    steamratingtext : json['steamRatingText'];
    steamratingpercent : json['steamRatingPercent'];
    steamratingcount : json['steamRatingCount'];
    steamappid : json['steamAppID'];
    releasedate : json['releaseDate'];
    lastchange : json['lastChange'];
    dealrating : json['dealRating'];
  }*/


}
