class LoginResponse {
  bool status;
  String message;
  User user;

  LoginResponse({
    required this.status,
    required this.message,
    required this.user,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        status: json["status"],
        message: json["message"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "user": user.toJson(),
      };
}

class User {
  String id_users;
  String username;
  String nama;
  String role;
  DateTime createdAt;

  User({
    required this.id_users,
    required this.username,
    required this.nama,
    required this.role,
    required this.createdAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id_users: json["id_users"],
        username: json["username"],
        nama: json["nama"],
        role: json["role"],
        createdAt: DateTime.parse(json["tanggal_registrasi"]),
      );

  Map<String, dynamic> toJson() => {
        "id_users": id_users,
        "username": username,
        "nama": nama,
        "role": role,
        "tanggal_registrasi": createdAt.toIso8601String(),
      };
}
