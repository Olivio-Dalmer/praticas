String formatHour(DateTime date) {
  String hour = date.hour.toString();
  String minut = date.minute.toString();
  if (date.hour.toString().length == 1) {
    hour = "0${date.hour}";
  }
  if (date.minute.toString().length == 1) {
    minut = "0${date.minute}";
  }
  return "$hour:$minut";
}
