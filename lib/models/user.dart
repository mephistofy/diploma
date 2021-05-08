class User {
  final String id;
  final String token;
  final List<dynamic> roles;
  final String avatar;
  final String fullname;
  final String department;
  final String email;

  // constructorUser(
  User({
    this.id,
    this.token,
    this.roles,
    this.avatar,
    this.fullname,
    this.department,
    this.email,
  });

  // create the user object from json input
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'].toString(),
      token: json['token'].toString(),
      roles: json['roles'],
      avatar: json['avatar'].toString(),
      fullname: json['fullname'].toString(),
      department: json['department'].toString(),
      email: json['email'].toString(),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'token': token,
    'roles': roles,
    'avatar': avatar,
    'fullname': fullname,
    'department': department,
    'email': email,
  };
}