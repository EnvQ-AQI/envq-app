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

  tipoColor(int rango) {
    _lista = rango > 0 && rango < 75
        ? <Color>[const Color(0xFF12B04e), const Color(0xFFCBE145)]
        : rango > 74 && rango < 100
            ? <Color>[const Color(0xFFBCB616), const Color(0xFFFEC56B)]
            : rango > 99 && rango < 150
                ? <Color>[const Color(0xFFA81616), const Color(0xFFD1E15C)]
                : rango > 149 && rango < 180
                    ? <Color>[const Color(0xFFAA1514), const Color(0xFFFF803B)]
                    : <Color>[const Color(0xFF9D1A19), const Color(0xFF482370)];

    _currentState = rango > 0 && rango < 75
        ? 'Bueno'
        : rango > 74 && rango < 100
            ? 'Moderado'
            : rango > 99 && rango < 150
                ? 'No saludable'
                : rango > 149 && rango < 180
                    ? 'Insalubre '
                    : 'Peligroso';

    _message = rango > 0 && rango < 75
        ? 'Puedes salir a caminar'
        : rango > 74 && rango < 100
            ? 'Puedes salir con precaución'
            : rango > 99 && rango < 150
                ? 'No es recomendable salir'
                : rango > 149 && rango < 180
                    ? 'Es peligroso salir'
                    : 'Quédate en casa';

    notifyListeners();
  }
}
