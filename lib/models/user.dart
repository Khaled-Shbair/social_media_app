class UserModel {
  late String email;
  late String name;
  late String phone;
  late String id;

  UserModel({
    required this.email,
    required this.name,
    required this.phone,
    required this.id,
  });

  UserModel.fromMap(Map<String, dynamic> user) {
    email = user['email'];
    name = user['name'];
    phone = user['phone'];
    id = user['id'];
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'name': name,
      'phone': phone,
      'id': id,
    };
  }
}
