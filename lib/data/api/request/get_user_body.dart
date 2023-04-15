// ignore_for_file: public_member_api_docs, sort_constructors_first
class GetUserBody {
  final String email;
  final String name;
  final String profilePic;
  final String uid;
  final String token;
  GetUserBody({
    required this.email,
    required this.name,
    required this.profilePic,
    required this.uid,
    required this.token,
  });

  Map<String, dynamic> toApi() {
    return {
      'email': email,
      'name': name,
      'profilePic': profilePic,
      'uid': uid,
      'token': token,
    };
  }

  GetUserBody copyWith({
    String? email,
    String? name,
    String? profilePic,
    String? uid,
    String? token,
  }) {
    return GetUserBody(
      email: email ?? this.email,
      name: name ?? this.name,
      profilePic: profilePic ?? this.profilePic,
      uid: uid ?? this.uid,
      token: token ?? this.token,
    );
  }
}
