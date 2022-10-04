class PostModel {
  late String id;
  late String name;
  late String text;
  late String dateTime;
  late String image;
  late String postImage;

  PostModel({
    required this.id,
    required this.text,
    required this.name,
    required this.dateTime,
    required this.postImage,
    required this.image,
  });

  PostModel.fromMap(Map<String, dynamic> user) {
    id = user['id'];
    text = user['text'];
    name = user['name'];
    dateTime = user['dateTime'];
    postImage = user['postImage'];
    image = user['image'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'bio': text,
      'name': name,
      'email': dateTime,
      'phone': postImage,
      'image': image,
    };
  }
}
