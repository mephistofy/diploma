class User {
  /*
  This class encapsulates the json response from the api
  {
      'userId': '1908789',
      'email': 'x7uytx@mundanecode.com'
      'password': '123456'
      'username': username,
      'name': 'Peter Clarke',
      'avatar': "photo",
  }
  */
  String _id;
  String _token;
  String _role;
  String _avatar;
  String _fullname;
  String _department;
  String _email;

  // constructorUser(
  User({
    String id,
    String token,
    String role,
    String avatar,
    String fullname,
    String department,
    String email,
  }) {
        this._id = id;
        this._token = token;
        this._role = role;
        this._avatar = avatar;
        this._fullname = fullname;
        this._department = department;
        this._email = email;
}

// Properties
String get id => _id;
set id(String id) => _id = id;
String get token => _token;
set token(String token) => _token = token;
String get role => _role;
set role(String role) => _role = role;
String get avatar => _avatar;
set avatar(String avatar) => _avatar = avatar;
String get fullname => _fullname;
set fullname(String fullname) => _fullname = fullname;
String get department => _department;
set department(String department) => _department = department;
String get email => _email;
set email(String email) => _email = email;

// create the user object from json input
User.fromJson(Map<String, dynamic> json) {
  _id = json['id'].toString();
  _token = json['token'];
  _role = json['role'];
  _avatar = json['avatar'];
  _fullname = json['fullname'];
  _department = json['department'];
  _email = json['email'];
}

}