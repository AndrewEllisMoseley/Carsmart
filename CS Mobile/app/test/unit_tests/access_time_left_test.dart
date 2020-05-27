import 'package:app/services/access_time_left.dart';
import 'package:test/test.dart';

void main() {
  AccessTimeLeft accessTimeLeft = new AccessTimeLeft();
  group('AccessTimeLeft Class', () {
    test("Should return error when no time left can be calculated", () {
      final now = DateTime.now();
      final _timeUntil =
          accessTimeLeft.timeLeft(new DateTime(now.year, now.month, now.day));
      expect(_timeUntil[0], 'error');
    });
  });
}
