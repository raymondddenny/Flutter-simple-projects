import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

enum ColorEvents { to_red, to_green }

/// digunakan untuk menyimpan state dan event dari color blocs

class ColorBlocs extends Bloc<ColorEvents, Color> {
  Color _color = Colors.red;

  @override
  Color get initialState => _color;

  @override
  // return stream
  Stream<Color> mapEventToState(ColorEvents event) async* {
    // ubah color berdasarkan event
    _color = (event == ColorEvents.to_red) ? Colors.red : Colors.green;
    // yield mengembalikan aliran data/stream
    yield _color;
  }
}
