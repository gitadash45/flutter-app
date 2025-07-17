class UserModel {
  final String username;
  final String imageUrl;
  final DateTime dob;
  final String gender;
  final List<String> hobbies;
  final String phoneNumber;

  UserModel({
    required this.username,
    required this.imageUrl,
    required this.dob,
    required this.gender,
    required this.hobbies,
    required this.phoneNumber,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      username: json['username'] as String,
      imageUrl: json['image_url'] as String,
      dob: DateTime.parse(json['dob'] as String),
      gender: json['gender'] as String,
      hobbies: List<String>.from(json['hobbies'] as List<dynamic>),
      phoneNumber: json['phone_number'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'image_url': imageUrl,
      'dob': dob.toIso8601String(),
      'gender': gender,
      'hobbies': hobbies,
      'phone_number': phoneNumber,
    };
  }
}
