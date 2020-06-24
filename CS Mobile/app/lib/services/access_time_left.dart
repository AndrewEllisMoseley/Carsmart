class AccessTimeLeft {
  List<String> timeLeft(DateTime due) {
    List<String> retVal = List(1);

    Duration _timeUntilDue = due.difference(DateTime.now());

    int _daysUntil = _timeUntilDue.inDays;
    int _hoursUntil = _timeUntilDue.inHours - (_daysUntil * 24);
    int _minUntil =
        _timeUntilDue.inMinutes - (_daysUntil * 24 * 60) - (_hoursUntil * 60);
    int _secUntil = _timeUntilDue.inSeconds -
        (_daysUntil * 24 * 60 * 60) -
        (_hoursUntil * 60 * 60) -
        (_minUntil * 60);

    if (_daysUntil > 0) {
      retVal[0] = _daysUntil.toString() +
          " days " +
          _hoursUntil.toString() +
          " hours " +
          _minUntil.toString() +
          " mins " +
          _secUntil.toString() +
          " secs";
    } else if (_hoursUntil > 0) {
      retVal[0] = _hoursUntil.toString() +
          " hours " +
          _minUntil.toString() +
          " mins " +
          _secUntil.toString() +
          " secs";
    } else if (_minUntil > 0) {
      retVal[0] =
          _minUntil.toString() + " mins " + _secUntil.toString() + " secs";
    } else if (_secUntil > 0) {
      retVal[0] = _secUntil.toString() + " secs";
    } else {
      retVal[0] = "error";
    }

    return retVal;
  }
}
