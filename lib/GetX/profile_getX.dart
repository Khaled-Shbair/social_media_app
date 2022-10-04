import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stores/models/user_model.dart';
import 'package:get/get.dart';

class ProfileGetX extends GetxController {
  static ProfileGetX get to => Get.find();
  RxBool loading = false.obs;
  final _fireStore = FirebaseFirestore.instance;

  @override
  void onInit() {
    super.onInit();
   // getUserData();
  }

  final _userModel = Rxn<UserModel>();

  UserModel? get userModel => _userModel.value;

  set userModel(UserModel? value) => _userModel.value = value;

  //Future<void> getUserData() async {
  //  loading.value = true;
  //  _fireStore.collection('users').doc().get().then((value) {
  //    userModel = UserModel.fromMap(value.data()!);
  //    loading.value = false;
  //  });
  //}

  Future<void> setDataUser({
    required bool isEmailVerified,
    required String email,
    required String image,
    required String cover,
    required String phone,
    required String name,
    required String bio,
    required String id,
  }) async {
    userModel = UserModel(
      isEmailVerified: isEmailVerified,
      cover: cover,
      email: email,
      phone: phone,
      image: image,
      name: name,
      bio: bio,
      id: id,
    );
    _fireStore.collection('users').doc(id).set(userModel!.toMap());
  }
}
