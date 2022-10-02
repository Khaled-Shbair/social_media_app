class UserModel {
  late String id;
  late String bio;
  late String name;
  late String email;
  late String phone;
  late String image;
  late String cover;
  late bool isEmailVerified;

  UserModel({
    required this.id,
    required this.bio,
    required this.name,
    required this.email,
    required this.phone,
    required this.image,
    required this.cover,
    required this.isEmailVerified,
  });

  UserModel.fromMap(Map<String, dynamic> user) {
    id = user['id'];
    bio = user['bio'];
    name = user['name'];
    email = user['email'];
    phone = user['phone'];
    image = user['image'];
    cover = user['cover'];
    isEmailVerified = user['isEmailVerified'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'bio': bio,
      'name': name,
      'email': email,
      'phone': phone,
      'image': image,
      'cover': cover,
      'isEmailVerified': isEmailVerified,
    };
  }
}
