import 'package:flutter/material.dart';

class Est extends ChangeNotifier {
  List<Color> _lista = <Color>[Color(0xFF12B04e), Color(0xFFCBE145)];

  get color {
    return _lista;
  }

  tipoColor(int rango) {
    _lista = rango > 0 && rango < 75
        ? <Color>[Color(0xFF12B04e), Color(0xFFCBE145)]
        : rango > 74 && rango < 100
            ? <Color>[Color(0xFFBCB616), Color(0xFFFEC56B)]
            : rango > 99 && rango < 150
                ? <Color>[Color(0xFFA81616), Color(0xFFD1E15C)]
                : rango > 149 && rango < 180
                    ? <Color>[Color(0xFFAA1514), Color(0xFFFF803B)]
                    : <Color>[Color(0xFF9D1A19), Color(0xFF482370)];

    notifyListeners();
  }
}