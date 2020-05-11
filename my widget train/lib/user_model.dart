import 'dart:convert';
import 'package:http/http.dart' as http;

class User {
  String id;
  String name;
  String email;
  String company;
  String url;
  String text;

  User({this.id, this.name, this.email, this.company, this.url, this.text});

  factory User.createUserResult(Map<String, dynamic> object) {
    return User(
      id: object['id'].toString(),
      name: object['first_name'] + " " + object['last_name'],
      email: object['email'],
      // company: object['company'],
      // url: object['url'],
      // text: object['text']
    );
  }

  static Future<User> connectToApi(String id) async {
    String apiUrlGET = "https://reqres.in/api/users/" + id;

    var urlResult = await http.get(apiUrlGET);
    var jsonObject = json.decode(urlResult.body);
    // get list data inside "data"
    var userData = (jsonObject as Map<String, dynamic>)['data'];

    return User.createUserResult(userData);
  }
}
