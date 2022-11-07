class UserModel {
  String uid;
  String email;
  String password;
  String userImage;
  String username;
  String bio;

  UserModel({
    this.uid = '',
    this.email = '',
    this.password = '',
    this.userImage = '',
    this.username = '',
    this.bio = '',
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "username": username,
      "uid": uid,
      "email": email,
      "userImage": userImage,
      "bio": bio,
    };
    return map;
  }

  factory UserModel.fromMap(Map<dynamic, dynamic>? dados) {
    return UserModel(
      uid: dados?['uid'] ?? '',
      username: dados?['username'] ?? '',
      userImage: dados?['userImage'] ?? '',
      bio: dados?['bio'] ?? '',
      email: dados?['email'] ?? '',
      password: dados?['password'] ?? '',
    );
  }

  factory UserModel.clean() {
    return UserModel(
      username: '',
      email: '',
    );
  }
}
