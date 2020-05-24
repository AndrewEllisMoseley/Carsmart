import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Carsmart Driver App Test', () {
    FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {
        await driver.close();
      }
    });

    test('check flutter driver health', () async {
      Health health = await driver.checkHealth();
      print(health.status);
    });

    // Future<void> delay([int milliseconds = 250]) async {
    //   await Future<void>.delayed(Duration(milliseconds: milliseconds));
    // }

    // test('sign in anonymously, sign out', () async {
    //   // 1. find and tap anonymous sign in button
    //   final anonymousSignInButton = find.byValueKey('login');
    //   // 2. check to fail early if the auth state is authenticated
    //   await driver.waitFor(anonymousSignInButton);
    //   // 3. add small delay for demo recording
    //   await delay(750);
    //   // 4. interact with UI
    //   await driver.tap(anonymousSignInButton);
    // });
  });
}
