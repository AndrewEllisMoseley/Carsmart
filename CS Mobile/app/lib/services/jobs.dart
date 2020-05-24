class Jobs {
  List<String> _jobs = [
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

  List<String> getJobs() {
    return _jobs;
  }

  String getJob(job) {
    switch (job) {
      case 'Receptionist':
        return 'receptionist';
      case 'Accountant':
        return 'accountant';
      case 'Operations':
        return 'operations';
      case 'Quality Control':
        return 'quality';
      case 'Supervisor':
        return 'supervisor';
      case 'Marketing':
        return 'marketing';
      case 'Purchasing':
        return 'purchasing';
      case 'Software Engineer':
        return 'software';
      case 'I.T. Support':
        return 'support';
      case 'Management':
        return 'management';
      case 'Safety and Environmental':
        return 'safety';
      default:
        return null;
    }
  }
}

Jobs jobs = new Jobs();
