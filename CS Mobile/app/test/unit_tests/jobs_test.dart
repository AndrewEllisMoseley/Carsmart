import 'package:app/services/jobs.dart';
import 'package:test/test.dart';

void main() {
  Jobs jobs = new Jobs();
  group('Jobs Class', () {
    test("Should return list of jobs", () {
      List<String> jobsList = [
        'Receptionist',
        'Accountant',
        'Operations',
        'Quality Control',
        'Supervisor',
        'Marketing',
        'Purchasing',
        'Software Engineer',
        'I.T. Support',
        'Management',
        'Safety and Environmental',
      ];
      expect(jobs.getJobs(), jobsList);
    });

    test("Should return job code for the full string", () {
      expect(jobs.getJob('Safety and Environmental'), 'safety');
    });
  });
}
