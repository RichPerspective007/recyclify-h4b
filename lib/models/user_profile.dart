class UserProfile {
  final String uid;
  final String name;
  final String? profilePictureUrl;

  UserProfile({
    required this.uid,
    required this.name,
    this.profilePictureUrl,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      uid: json['uid'],
      name: json['name'],
      profilePictureUrl: json['profilePictureUrl'],
    );
  }

  get pfpURL => null;

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'name': name,
      'profilePictureUrl': profilePictureUrl,
    };
  }
}
