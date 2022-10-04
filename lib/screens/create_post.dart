import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors_app.dart';
import '../widgets/text_app.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({Key? key}) : super(key: key);

  @override
  State<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(bottom: 40),
      child: Column(
        children: [
          const ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://img.freepik.com/free-photo/red-haired-serious-young-man-blogger-looks-confidently_273609-16730.jpg?w=740&t=st=1664705051~exp=1664705651~hmac=5108c75d5c667e66adf84e10e4ee26fdb284c0d923a19cde765253948d9099db'),
              radius: 30,
            ),
            title: TextApp(
              data: 'Saja F.ALAshram',
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsetsDirectional.only(start: 25, top: 10),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: 'what_is_on_your_mind'.tr,
                  hintStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.all(10),
            child: Row(
              children: [
                Expanded(
                  child: ListTile(
                    onTap: () {},
                    leading:
                        const Icon(Icons.image, color: Colors.blue, size: 30),
                    horizontalTitleGap: 0,
                    title: const Text(
                      'add_image',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'tags'.tr,
                      style: const TextStyle(
                        fontSize: 24,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(200, 50),
              backgroundColor: ColorsApp.green,
              textStyle:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            child: Text('create'.tr),
          ),
        ],
      ),
    );
  }
}
