import 'package:flutter/material.dart';

class HeroClip extends StatefulWidget {
  @override
  _HeroClipState createState() => _HeroClipState();
}

class _HeroClipState extends State<HeroClip> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(
          'Latihan hero animation',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return SecondPage();
          }));
        },
        child: Hero(
          tag: 'pp',
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Container(
              height: 100,
              width: 100,
              child: Image(
                fit: BoxFit.cover,
                image: NetworkImage(
                    "https://static.duniaku.net/2019/06/D9VoZlrVAAAJqp3.jpg"),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(
          'Latihan hero animation',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Hero(
          tag:
              'pp', // this tag for mark the object that we want to give the hero animation, both object must have the same tag
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Container(
              height: 400,
              width: 400,
              child: Image(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      "https://static.duniaku.net/2019/06/D9VoZlrVAAAJqp3.jpg")),
            ),
          ),
        ),
      ),
    );
  }
}
