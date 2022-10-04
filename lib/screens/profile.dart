import '../widgets/profile_information.dart';
import 'package:flutter/material.dart';
import '../GetX/profile_getX.dart';
import '../widgets/loading.dart';
import 'package:get/get.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return GetX<ProfileGetX>(
      builder: (controller) {
        if (ProfileGetX.to.loading.isTrue) {
          return const Loading();
        }
        return buildProfile();
      },
    );
  }

  Widget buildProfile() {
    if (ProfileGetX.to.userModel != null) {
      return ListView(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsetsDirectional.only(start: 10, end: 10),
        children: [
          SizedBox(
            height: 200,
            child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Align(
                  alignment: AlignmentDirectional.topCenter,
                  child: Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    elevation: 20,
                    child: Image.network(
                      ProfileGetX.to.userModel!.cover,
                      fit: BoxFit.cover,
                      height: 150,
                      width: double.infinity,
                    ),
                  ),
                ),
                CircleAvatar(
                  radius: 63,
                  child: CircleAvatar(
                    backgroundImage:
                        NetworkImage(ProfileGetX.to.userModel!.image),
                    radius: 60,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Text(
            ProfileGetX.to.userModel!.name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            ProfileGetX.to.userModel!.bio,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black45,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ProfileInformation(
                count: '100',
                type: 'Pose',
                onTap: () {},
              ),
              ProfileInformation(
                count: '256',
                type: 'Photos',
                onTap: () {},
              ),
              ProfileInformation(
                count: '100K',
                type: 'Followers',
                onTap: () {},
              ),
              ProfileInformation(
                count: '64',
                type: 'Followings',
                onTap: () {},
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  child: const Text('Edit Profile'),
                ),
              ),
              const SizedBox(width: 10),
              OutlinedButton(
                onPressed: () {},
                child: const Icon(Icons.edit),
              ),
            ],
          ),
        ],
      );
    } else {
      return const Loading();
    }
  }
}
