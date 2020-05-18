import 'package:flutter/material.dart';
import 'package:media_query/bloc/color_bloc.dart';

class BlocWithoutPackage extends StatefulWidget {
  @override
  _BlocWithoutPackageState createState() => _BlocWithoutPackageState();
}

class _BlocWithoutPackageState extends State<BlocWithoutPackage> {
  ColorBloc colorBloc = ColorBloc();

// override dispose
  @override
  void dispose() {
    colorBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.red,
            onPressed: () {
              colorBloc.eventSink.add(ColorEvents.to_red);
            },
          ),
          SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            backgroundColor: Colors.green,
            onPressed: () {
              colorBloc.eventSink.add(ColorEvents.to_green);
            },
          ),
        ],
      ),
      appBar: AppBar(
        title: Text("BloC without package"),
      ),
      body: Center(
          // StreamBuilder, built widget setiap kali ada update dari stream
          child: StreamBuilder(
        builder: (context, snapshot) {
          return AnimatedContainer(
            duration: Duration(milliseconds: 500),
            height: 100,
            width: 100,
            color: snapshot.data,
          );
        },
        stream: colorBloc.stateStream,
        initialData: Colors.red,
      )),
    );
  }
}
