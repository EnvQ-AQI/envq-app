import 'package:flutter/material.dart';

class ColorModel extends ChangeNotifier {
  List<Color> _lista = <Color>[
    const Color(0xFF12B04e),
    const Color(0xFFCBE145)
  ];
  String _currentState = 'Moderado';
  String _message = 'Puedes salir con precaución';

  get color {
    return _lista;
  }

  get currentState {
    return _currentState;
  }

  get message {
    return _message;
  }

  tipoColor(int range) async {
    _lista = range > 0 && range < 51
        ? <Color>[const Color(0xFF12B04e), const Color(0xFFCBE145)]
        : range > 50 && range < 101
            ? <Color>[const Color(0xFFBCB616), const Color(0xFFFEC56B)]
            : range > 100 && range < 151
                ? <Color>[const Color(0xFFA81616), const Color(0xFFD1E15C)]
                : range > 150 && range < 201
                    ? <Color>[const Color(0xFFAA1514), const Color(0xFFFF803B)]
                    : <Color>[const Color(0xFF9D1A19), const Color(0xFF482370)];

    _currentState = range > 0 && range < 51
        ? 'Bueno'
        : range > 50 && range < 101
            ? 'Moderado'
            : range > 100 && range < 151
                ? 'No saludable'
                : range > 150 && range < 201
                    ? 'Insalubre '
                    : 'Peligroso';

    _message = range > 0 && range < 51
        ? 'Puedes salir a caminar'
        : range > 50 && range < 101
            ? 'Puedes salir con precaución'
            : range > 100 && range < 151
                ? 'No es recomendable salir'
                : range > 150 && range < 201
                    ? 'Es peligroso salir'
                    : 'Quédate en casa';

    notifyListeners();
  }
}
