part of 'models.dart';

class RegisterUser {
  final String name;
  final String email;
  final String password;
  final int roleId;

  RegisterUser({
    required this.name,
    required this.email,
    required this.password,
    required this.roleId,
  });
}

class LoginUser {
  final String name;
  final String password;

  LoginUser({
    required this.name,
    required this.password,
  });
}

class User {
  final int idUser;
  final String name;
  final String email;
  final int roleId;

  User({
    required this.idUser,
    required this.name,
    required this.email,
    required this.roleId,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      idUser: json['id_user'] as int,
      name: json['username'] as String,
      email: json['email'] as String,
      roleId: json['role_id'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_user': idUser,
      'name': name,
      'email': email,
      'role_id': roleId,
    };
  }
}
