class People {
  final String id;
  final String departmentName;
  final List<dynamic> roles;
  final String avatar;
  final String fullName;
  final String email;

  // constructorUser(
  People({
    this.id,
    this.departmentName,
    this.roles,
    this.avatar,
    this.fullName,
    this.email,
  });

  // create the user object from json input
  factory People.fromJson(Map<String, dynamic> json) {
    return People(
      id: json['id'].toString(),
      departmentName: json['department_name'].toString(),
      roles: json['roles'],
      avatar: json['avatar'].toString(),
      fullName: json['fullname'].toString(),
      email: json['email'].toString(),
    );
  }

  String get _id => id;
  String get _departmentName => departmentName;
  List<dynamic> get _roles => roles;
  String get _avatar => avatar;
  String get _fullName => fullName;
  String get _email => email;

  Map<String, dynamic> toJson() => {
    'id': id,
    'department_name': departmentName,
    'roles': roles,
    'avatar': avatar,
    'fullname': fullName,
    'email': email,
  };
}