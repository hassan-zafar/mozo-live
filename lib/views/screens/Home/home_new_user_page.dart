import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mozolive/Components/custom_button_inter.dart';
import 'package:mozolive/Theme/colors.dart';
import 'package:mozolive/Theme/constants.dart';
import 'package:mozolive/controllers/search_controller.dart';
import 'package:mozolive/models/user.dart';

class HomeNewUserFollowPage extends StatelessWidget {
  HomeNewUserFollowPage({Key? key}) : super(key: key);

  final SearchController searchController = Get.put(SearchController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 80,
            ),
            Text(
              'Trending Creators',
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(color: lightTextColor),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 28.0, right: 28.0, top: 8, bottom: 8),
              child: Text(
                'Subscribe to an account if you want to see more of their stories and help direct the endings',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
            Obx(
              () {
                searchController.allUsers();
                return Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) {
                      AppUserModel user = searchController.searchedUsers[index];
                      print(user.profilePhoto);
                      return Container(
                        margin: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius: borderRadius,
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            CachedNetworkImage(
                              imageUrl: user.profilePhoto,
                              fit: BoxFit.cover,
                              color: Colors.black45,
                              colorBlendMode: BlendMode.darken,
                              height: 380,
                              width: 280,
                            ),
                            Positioned(
                              bottom: 160,
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    backgroundImage: CachedNetworkImageProvider(
                                        user.profilePhoto),
                                  ),
                                  Text(
                                    user.name,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5!
                                        .copyWith(color: lightTextColor),
                                  ),
                                  CustomTextButtonIntr(
                                      height: 50,
                                      width: 150,
                                      onTap: ()async {
                                       await searchController.followUser(user.uid);
                                      },
                                      fontSize: 16,
                                      isGradient: true,
                                      text: 'Follow'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    itemCount: searchController.searchedUsers.length,
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
