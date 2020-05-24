class User {
  final String firstName;
  final String lastName;
  final String email;
  final String username;
  final String company;
  final String job;
  final int tokenExpiry;

  User(
      {this.firstName,
      this.lastName,
      this.email,
      this.username,
      this.company,
      this.job,
      this.tokenExpiry});

  factory User.fromJson(dynamic json) {
    return User(
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      username: json['username'],
      company: json['company'],
      job: json['job'],
      tokenExpiry: json['exp'],
    );
  }

  @override
  String toString() => 'User { name: $firstName, email: $email}';
}
