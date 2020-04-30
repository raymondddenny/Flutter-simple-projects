import 'package:flutter/material.dart';

class DragPage extends StatefulWidget {
  @override
  _DragPageState createState() => _DragPageState();
}

class _DragPageState extends State<DragPage> {
  Color color1 = Colors.amber;
  Color color2 = Colors.blue;
  Color color3 = Colors.red;
  Color color4 = Colors.green;
  Color targetColor;
  bool isAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Draggable Widget'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                'The Colors',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Draggable<Color>(
                    data: color1,
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: Material(
                        color: color1,
                        shape: StadiumBorder(),
                        elevation: 3,
                      ),
                    ),
                    childWhenDragging: SizedBox(
                      width: 50,
                      height: 50,
                      child: Material(
                        color: Colors.black26,
                        shape: StadiumBorder(),
                      ),
                    ),
                    feedback: SizedBox(
                      width: 50,
                      height: 50,
                      child: Material(
                        color: color1.withOpacity(0.5),
                        shape: StadiumBorder(),
                        elevation: 3,
                      ),
                    ),
                  ),
                  Draggable<Color>(
                    data: color2,
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: Material(
                        color: color2,
                        shape: StadiumBorder(),
                        elevation: 3,
                      ),
                    ),
                    childWhenDragging: SizedBox(
                      width: 50,
                      height: 50,
                      child: Material(
                        color: Colors.black26,
                        shape: StadiumBorder(),
                      ),
                    ),
                    feedback: SizedBox(
                      width: 50,
                      height: 50,
                      child: Material(
                        color: color2.withOpacity(0.5),
                        shape: StadiumBorder(),
                        elevation: 3,
                      ),
                    ),
                  ),
                  Draggable<Color>(
                    data: color3,
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: Material(
                        color: color3,
                        shape: StadiumBorder(),
                        elevation: 3,
                      ),
                    ),
                    childWhenDragging: SizedBox(
                      width: 50,
                      height: 50,
                      child: Material(
                        color: Colors.black26,
                        shape: StadiumBorder(),
                      ),
                    ),
                    feedback: SizedBox(
                      width: 50,
                      height: 50,
                      child: Material(
                        color: color3.withOpacity(0.5),
                        shape: StadiumBorder(),
                        elevation: 3,
                      ),
                    ),
                  ),
                  Draggable<Color>(
                    data: color4,
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: Material(
                        color: color4,
                        shape: StadiumBorder(),
                        elevation: 3,
                      ),
                    ),
                    childWhenDragging: SizedBox(
                      width: 50,
                      height: 50,
                      child: Material(
                        color: Colors.black26,
                        shape: StadiumBorder(),
                      ),
                    ),
                    feedback: SizedBox(
                      width: 50,
                      height: 50,
                      child: Material(
                        color: color4.withOpacity(0.5),
                        shape: StadiumBorder(),
                        elevation: 3,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Text('Put your favorite color below:'),
              SizedBox(
                height: 10,
              ),
              DragTarget<Color>(
                onWillAccept: (value) => true,
                onAccept: (value) {
                  isAccepted = true;
                  targetColor = value;
                },
                builder: (context, candidates, rejected) {
                  return (isAccepted)
                      ? SizedBox(
                          width: 500,
                          height: 500,
                          child: Expanded(
                            child: Material(
                              color: targetColor,
                              // shape: StadiumBorder(),
                            ),
                          ),
                        )
                      : SizedBox(
                          width: 500,
                          height: 500,
                          child: Material(
                            color: Colors.black26,
                            // shape: StadiumBorder(),
                          ),
                        );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
