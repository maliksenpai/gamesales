import 'package:game_sales/data/api.dart';
import 'package:test/test.dart';
import 'package:game_sales/bloc/apibloc.dart';

void main() {
  test("api baglantisi", () async{
    Api api = Api.api;
    await api.getGames();
    expect(await api.apitest, true);
  });

  test("veri alma", () async {
    ApiBloc bloc = ApiBloc();
    await bloc.getGames2();
    expect(await bloc.testapi, true);
  });
}