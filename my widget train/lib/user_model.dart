import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:media_query/json/ad.dart';
import 'package:media_query/json/data.dart';

// in this user model, i access json file which have 2 json object inside
// first i make the class to contain the key and value parameter
// then i called the class here UserData & UserAd

class User {
  UserData data;
  UserAd ad;

  User({this.data, this.ad});

  factory User.createUserResult(Map<String, dynamic> object) {
    return User(
        data: UserData.fromJson(object["data"]),
        ad: UserAd.fromJson(object["ad"]));
  }
  static Future<User> connectToApi(String id) async {
    // assign api url
    String apiUrl = "https://reqres.in/api/users/" + id;

    // called GET method API
    var apiResult = await http.get(apiUrl);
    var jsonObject = json.decode(apiResult.body);
    // cast the json object that we get to a variaable
    var userData = (jsonObject as Map<String, dynamic>);

    // Call the factory method
    return User.createUserResult(userData);
  }
}
