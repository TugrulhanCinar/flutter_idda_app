import 'dart:convert';
import 'package:flutteriddaapp/models/kuponModel.dart';
import 'package:http/http.dart' as http;

class KuponClient{
 final baseUrl = "https://protahmin.herokuapp.com/coupons";
 // final baseUrl = "asdfasdfasdfasdf";

  Future<Kupon> fetchAllKupons() async{
    final _istek = await http.get(baseUrl);
    if(_istek.statusCode !=200){
      throw Exception("Veri çekilirken bir hata oluştu: " +_istek.statusCode.toString());
    }
    return Kupon.fromJson(jsonDecode(_istek.body));
  }
}