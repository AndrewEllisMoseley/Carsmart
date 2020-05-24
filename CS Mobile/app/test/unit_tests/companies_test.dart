import 'package:app/services/compnaies.dart';
import 'package:test/test.dart';

void main() {
  Companies companies = new Companies();
  group('Companies Class', () {
    test("Should return list of companies", () {
      List<String> companiesList = ['Admiral Group', 'AA Insurance', 'Veygo'];
      expect(companies.getCompanies(), companiesList);
    });

    test("Should return company code for the full string", () {
      expect(companies.getCompany('Veygo'), 'VEY');
    });
  });
}
