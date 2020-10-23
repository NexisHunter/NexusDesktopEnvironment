import 'package:flutter_test/flutter_test.dart';
import 'package:nexus_desktop_environment/system/applications.dart';

void main() {
  group("Applications: ", () {
    test("Application", () {
      final echo = Application(name: "Echo", path: "/usr/bin/echo");
      expect(echo.name, "Echo");
      expect(echo.path, "/usr/bin/echo");
      expect(echo.process, null);
    });
    group("Manager", () {
      ApplicationManager manger;
      setUpAll(() {
        manger = ApplicationManager();
      });
      test('Default Set Up', () {
        expect(manger.installedApps.length > 0, isTrue);
        expect(manger.runningApps.length == 0, isTrue);
      });
    });
  });
}
