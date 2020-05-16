import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref extends StatefulWidget {
  @override
  _SharedPrefState createState() => _SharedPrefState();
}

class _SharedPrefState extends State<SharedPref> {
  TextEditingController controller = TextEditingController(text: "No Data");
  bool isOn = false;

  // method untuk simpan data
  void saveData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("teksfield", controller.text);
    sharedPreferences.setBool("ison", isOn);
  }

  Future<String> getNama() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString("teksfield") ?? "No Data";
  }

  Future<bool> getOn() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool("ison") ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Shared preference example"),
        ),
        body: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              TextField(
                controller: controller,
              ),
              Switch(
                value: isOn,
                onChanged: (newValue) {
                  setState(() {
                    isOn = newValue;
                  });
                },
              ),
              RaisedButton(
                child: Text("Save"),
                onPressed: () {
                  saveData();
                },
              ),
              RaisedButton(
                child: Text("Load"),
                onPressed: () {
                  getNama().then((value) {
                    controller.text = value;
                    setState(() {});
                  });
                  getOn().then((value) {
                    isOn = value;
                    setState(() {});
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
