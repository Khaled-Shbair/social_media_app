import 'package:flutter/material.dart';
import '../constants/colors_app.dart';
import '../widgets/text_app.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('home'.tr)),
      body: ListView(
        children: [
          Stack(
            alignment: AlignmentDirectional.topEnd,
            children: [
              Card(
                margin: const EdgeInsetsDirectional.all(8),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                elevation: 20,
                child: Image.network(
                  'https://img.freepik.com/free-photo/close-up-young-handsome-man-isolated_273609-35826.jpg?w=740&t=st=1664701704~exp=1664702304~hmac=0492634faac4aeaecdb6fe70e324ccaefa5150050b3a50c16608ac0f9115726c',
                  fit: BoxFit.cover,
                  height: 250,
                  width: double.infinity,
                ),
              ),
              const Padding(
                padding: EdgeInsetsDirectional.only(
                  end: 20,
                  top: 35,
                ),
                child: TextApp(
                  data: 'Communicate with friends',
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => buildPostItem(),
              separatorBuilder: (context, index) => const SizedBox(height: 5),
              itemCount: 10),
        ],
      ),
    );
  }

  Widget buildPostItem() {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 10,
      child: Padding(
        padding: const EdgeInsetsDirectional.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://img.freepik.com/free-photo/red-haired-serious-young-man-blogger-looks-confidently_273609-16730.jpg?w=740&t=st=1664705051~exp=1664705651~hmac=5108c75d5c667e66adf84e10e4ee26fdb284c0d923a19cde765253948d9099db'),
                  radius: 30,
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          TextApp(
                            data: 'Saja F.ALAshram',
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                          SizedBox(width: 5),
                          Icon(
                            Icons.check_circle,
                            color: Colors.blue,
                            size: 16,
                          ),
                        ],
                      ),
                      Text(
                        'January 21, 2022 at 1:14 pm',
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_horiz,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Divider(
              color: Colors.grey.shade400,
              thickness: 1,
            ),
            const Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              elevation: 5,
              child: Image.network(
                'https://img.freepik.com/free-photo/close-up-young-handsome-man-isolated_273609-35826.jpg?w=740&t=st=1664701704~exp=1664702304~hmac=0492634faac4aeaecdb6fe70e324ccaefa5150050b3a50c16608ac0f9115726c',
                fit: BoxFit.cover,
                height: 150,
                width: double.infinity,
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                top: 10,
                start: 10,
                end: 10,
                bottom: 5,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        const Icon(
                          Icons.favorite,
                          color: ColorsApp.red,
                          size: 18,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          '120',
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        const Icon(
                          Icons.chat,
                          color: ColorsApp.green,
                          size: 15,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          '120 Comment',
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.grey.shade400,
              thickness: 1,
            ),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        const CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://img.freepik.com/free-photo/red-haired-serious-young-man-blogger-looks-confidently_273609-16730.jpg?w=740&t=st=1664705051~exp=1664705651~hmac=5108c75d5c667e66adf84e10e4ee26fdb284c0d923a19cde765253948d9099db'),
                          radius: 18,
                        ),
                        const SizedBox(width: 15),
                        Text(
                          'write a comment ...',
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Row(
                        children: [
                          const Icon(
                            Icons.favorite_border,
                            color: ColorsApp.red,
                            size: 18,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            'Like',
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
