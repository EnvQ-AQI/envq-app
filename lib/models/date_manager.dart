class DateManager {
  late DateTime current = DateTime.now();

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
}
