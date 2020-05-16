import 'package:flutter/material.dart';

class Text_Field extends StatefulWidget {
  @override
  _Text_FieldState createState() => _Text_FieldState();
}

class _Text_FieldState extends State<Text_Field> {
  TextEditingController controller = TextEditingController(text: "nilai awal");
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("TextField example"),
        ),
        body: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              TextField(
                onChanged: (value) {
                  setState(() {});
                },
                controller: controller,
              ),
              Text("Tampilan hasil ketikan"),
              Text(controller.text),
            ],
          ),
        ),
      ),
    );
  }
}
