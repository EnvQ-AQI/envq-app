import 'package:bases_flutter/models/date_manager.dart';
import 'package:flutter/material.dart';

class DateManagerProvider extends ChangeNotifier {
  DateTime _current = DateTime.now();

  DateTime get current => _current;

  static const months = ["enero", "febrero", "marzo", "abril", "mayo", "junio", "julio", "agosto", "septiembre", "octubre", "noviembre", "diciembre"];
  String formattedDateTime() {
    return "${current.day} de ${months[current.month-1]} de ${current.year}";
  }

  DateTime getUsefulDate() {
    return DateTime(current.year, current.month, current.day);
  }

  int getEpoch() {
    return getUsefulDate().millisecondsSinceEpoch;
  }

  DateTime lastSevenDays() {
    return getUsefulDate().subtract(const Duration(days: 7));
  }

  setDate(DateTime newDate) {
    _current = newDate;
    notifyListeners();
  }
}
