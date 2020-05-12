import 'package:flutter/material.dart';
import 'package:media_query/post_result_model.dart';
import 'package:media_query/user_model.dart';

class HTTPReq extends StatefulWidget {
  @override
  _HTTPReqState createState() => _HTTPReqState();
}

class _HTTPReqState extends State<HTTPReq> {
  PostRes postResult = null;
  User user = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('latihan HTTP Request (POST Method) API'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text((postResult != null)
                ? postResult.id +
                    "\n" +
                    postResult.name +
                    "\n" +
                    postResult.job +
                    "\n" +
                    postResult.createdAt
                : "Tidak ada Data POST"),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text((user != null)
                  ? user.data.id +
                      "\n" +
                      user.data.email +
                      "\n" +
                      user.data.name +
                      "\n" +
                      user.ad.company +
                      "\n" +
                      user.ad.url +
                      "\n" +
                      user.ad.text
                  : "Tidak ada Data POST"),
            ),
            RaisedButton(
              onPressed: () {
                // panggil method call API
                PostRes.connectToAPI("Denny", "Programmer").then((value) {
                  postResult = value;
                  setState(() {});
                });
              },
              child: Text('POST'),
            ),
            RaisedButton(
              onPressed: () {
                // panggil method call API
                User.connectToApi("2").then((users) {
                  user = users;
                  setState(() {});
                });
              },
              child: Text('GET'),
            ),
          ],
        ),
      ),
    );
  }
}
