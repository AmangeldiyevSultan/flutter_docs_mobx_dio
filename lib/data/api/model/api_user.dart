class ApiUser {
  final String email;
  final String name;
  final String profilePic;
  final String uid;
  final String token;

  ApiUser.fromApi(Map<String, dynamic> map)
      : email = map['user']['email'],
        name = map['user']['name'],
        profilePic = map['user']['profilePic'],
        uid = map['user']['_id'],
        token = map['token'];
}
