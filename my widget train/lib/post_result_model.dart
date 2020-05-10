import 'dart:convert';

import 'package:http/http.dart' as http;

class PostRes {
  // buat class dengan data yang ingin ditampilkan
  String id, name, job, createdAt;

// Constructor
  PostRes({this.id, this.name, this.job, this.createdAt});

// factory method = membuat object dari class PostRes, hasil mapping dari JSON object
  factory PostRes.createPostResult(Map<String, dynamic> object) {
    return PostRes(
        id: object['id'],
        name: object['name'],
        job: object['job'],
        createdAt: object['createdAt']);
  }

  // method untuk menggabungkan API dengan aplikasi
  static Future<PostRes> connectToAPI(String name, String job) async {
    // isi dengan url api
    String apiUrl = "https://reqres.in/api/users";

    // panggil http post
    var apiResult = await http.post(apiUrl, body: {
      // ketik parameter request
      "name": name,
      "job": job
    });
    // ubah ke json object
    var jsonObject = json.decode(apiResult.body);

    return PostRes.createPostResult(jsonObject);
  }
}
