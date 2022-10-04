import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

class PostGetX {
  RxBool loading = false.obs;
  final _fireStorage = FirebaseStorage.instance;
  late File postImage;

  Future<void> getPostImage() async {
    //final pickedFile=await picker.getImage(source:ImageSource.gallery);
    //if(pickedFile!=null){
    //  postImage=File(pickedFile.path);
    //}
    //TODO
  }

  void createPost({
    required String id,
    required String name,
    required String text,
    required String dateTime,
    required String image,
    // required String postImage,
  }) {
    loading.value = true;
    _fireStorage
        .ref()
        .child('posts/${Uri.file(postImage.path).pathSegments.last}')
        .putFile(postImage)
        .then((value) {
      value.ref.getDownloadURL();
    });
  }
}
