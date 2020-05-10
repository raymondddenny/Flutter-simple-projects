import 'package:flutter/material.dart';
import 'package:media_query/post_result_model.dart';

class HTTPReq extends StatefulWidget {
  @override
  _HTTPReqState createState() => _HTTPReqState();
}

class _HTTPReqState extends State<HTTPReq> {
  PostRes postResult = null;
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
                : "Tidak ada Data"),
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
          ],
        ),
      ),
    );
  }
}
