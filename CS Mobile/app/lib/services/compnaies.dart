class Companies {
  List<String> _companies = ['Admiral Group', 'AA Insurance', 'Veygo'];

  List<String> getCompanies() {
    return _companies;
  }

  String getCompany(company) {
    switch (company) {
      case 'Admiral Group':
        return 'AGL';
      case 'AA Insurance':
        return 'AA';
      case 'Veygo':
        return 'VEY';
      default:
        return null;
    }
  }
}

Companies companies = new Companies();
