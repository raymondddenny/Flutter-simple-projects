// enum untuk membuat jenis color event
import 'dart:async';

import 'package:flutter/material.dart';

enum ColorEvents { to_red, to_green }

class ColorBloc {
  // variable untuk simpan state default
  Color _color = Colors.red;

  // buat stream controller, color event dan color state
  StreamController<ColorEvents> _eventsController =
      StreamController<ColorEvents>();
  StreamSink<ColorEvents> get eventSink => _eventsController.sink;

  StreamController<Color> _stateController = StreamController<Color>();
  StreamSink<Color> get _stateSink => _stateController.sink;
  // keluarannya
  Stream<Color> get stateStream => _stateController.stream;

  // map event to state, didapat dari stream color events
  void _mapEventToState(ColorEvents colorEvents) {
    // cek color event
    if (colorEvents == ColorEvents.to_red) {
      _color = Colors.red;
    } else {
      _color = Colors.green;
    }

    // hubungkan mapEventToState ke state sink
    _stateSink.add(_color);
  }

// constructor
  ColorBloc() {
    // menghubungkan stream dari eventController ke method _mapEventToState
    _eventsController.stream.listen(_mapEventToState);
  }

  // method untuk membersihkan sink, agar memory tidak terpakai jika bloc
  // tidak digunakan

  void dispose() {
    _eventsController.close();
    _stateController.close();
  }
}
