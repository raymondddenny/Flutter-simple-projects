import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media_query/bloc/bloc_color.dart';

/**
 * class bloc yang menggunakan pub flutter_bloc
 */
class BlocWithLibrary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ambil blocprovider, dari root
    ColorBlocs colorBlocs = BlocProvider.of<ColorBlocs>(context);
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.red,
            onPressed: () {
              colorBlocs.add(ColorEvents.to_red);
            },
          ),
          SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            backgroundColor: Colors.green,
            onPressed: () {
              colorBlocs.add(ColorEvents.to_green);
            },
          ),
        ],
      ),
      appBar: AppBar(
        title: Text("BLoC with Flutter Bloc"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BlocBuilder<ColorBlocs, Color>(
              // currentColor diisi _color
              builder: (context, currentColor) => AnimatedContainer(
                height: 100,
                width: 100,
                color: currentColor,
                duration: Duration(milliseconds: 500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
