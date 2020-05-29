import 'package:flutter/material.dart';

class CustomStockBar extends StatelessWidget {
  final double width; // untuk lebar
  final int value; //nilai yang terisi
  final int totalValue; // nilai max progress bar

// constructor
  CustomStockBar({this.width, this.value, this.totalValue});
  @override
  Widget build(BuildContext context) {
    double ratio = value / totalValue;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.featured_play_list),
              SizedBox(
                width: 5,
              ),
              Text(value.toString()),
              Text("/10 buah")
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Stack(
            children: [
              Container(
                width: width,
                height: 8,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              Material(
                borderRadius: BorderRadius.circular(5),
                child: AnimatedContainer(
                  height: 8,
                  width: width * ratio,
                  duration: Duration(milliseconds: 500),
                  decoration: BoxDecoration(
                    color: (ratio < 0.3)
                        ? Colors.red
                        : (ratio < 0.6) ? Colors.amber : Colors.lightGreen,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
