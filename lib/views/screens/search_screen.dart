import 'package:flutter/material.dart';
import 'package:mozolive/Theme/colors.dart';
import 'package:mozolive/controllers/search_controller.dart';
import 'package:get/get.dart';
import 'package:mozolive/models/user.dart';
import 'package:mozolive/utilities/utilities.dart';
import 'package:mozolive/views/screens/profile_screen.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);

  final SearchController searchController = Get.put(SearchController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SafeArea(
        child: Scaffold(
             appBar: PreferredSize(
            preferredSize: const Size.fromHeight(120.0),
            child: Container(
              margin: const EdgeInsets.all(20.0),
              padding:
                  const EdgeInsets.symmetric(vertical: 0.0, horizontal: 24.0),
              decoration: BoxDecoration(
                color: textFieldColor,
                borderRadius: BorderRadius.circular(Utilities.borderRadius),
              ),
              child: TextField(
                readOnly: true,onSubmitted:(value) => searchController.searchUser(value) ,
                // onTap: () => Navigator.pushNamed(context, PageRoutes.searchPage),
                decoration: InputDecoration(
                  icon: Icon(Icons.search, color: secondaryColor),
                  border: InputBorder.none,
                  hintText:'Search',
                  hintStyle: Theme.of(context).textTheme.subtitle1,
                ),
              ),
            ),
          ),
        
          body: searchController.searchedUsers.isEmpty
              ? ListView.builder(
                  itemCount: searchController.searchedUsers.length,
                  itemBuilder: (context, index) {
                    AppUserModel user = searchController.searchedUsers[index];
                    return InkWell(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ProfileScreen(uid: user.uid),
                        ),
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                            user.profilePhoto,
                          ),
                        ),
                        title: Text(
                          user.name,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  },
                )
     
              : ListView.builder(
                  itemCount: searchController.searchedUsers.length,
                  itemBuilder: (context, index) {
                    AppUserModel user = searchController.searchedUsers[index];
                    return InkWell(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ProfileScreen(uid: user.uid),
                        ),
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                            user.profilePhoto,
                          ),
                        ),
                        title: Text(
                          user.name,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  },
                ),
        ),
      );
    });
  }
}
