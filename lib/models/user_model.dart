class UserModel {
  UserModel({
    required this.id,
    required this.username,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.role,
    required this.hashedPassword,
    required this.image,
    required this.accessToken,
    required this.refreshToken,
  });

  final String? id;
  final String? username;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? gender;
  final String? role;
  final String? hashedPassword;
  final String? image;
  final String? accessToken;
  final String? refreshToken;

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"].toString(),
      username: json["username"],
      email: json["email"],
      firstName: json["firstName"],
      lastName: json["lastName"],
      gender: json["gender"],
      role: json["role"],
      hashedPassword: json["hashed_password"],
      image: json["image"],
      accessToken: json["accessToken"],
      refreshToken: json["refreshToken"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
        "gender": gender,
        "role": role,
        "hashed_password": hashedPassword,
        "image": image,
        "accessToken": accessToken,
        "refreshToken": refreshToken,
      };
}
