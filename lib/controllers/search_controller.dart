import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:mozolive/Constants/constants.dart';
import 'package:mozolive/controllers/profile_controller.dart';
import 'package:mozolive/models/user.dart';

class SearchController extends GetxController {
  final Rx<List<AppUserModel>> _searchedUsers = Rx<List<AppUserModel>>([]);
  final ProfileController profileController = Get.put(ProfileController());

  List<AppUserModel> get searchedUsers => _searchedUsers.value;

  searchUser(String typedUser) async {
    _searchedUsers.bindStream(firestore
        .collection('users')
        .where('name', isGreaterThanOrEqualTo: typedUser)
        .snapshots()
        .map((QuerySnapshot query) {
      List<AppUserModel> retVal = [];
      for (var elem in query.docs) {
        retVal.add(AppUserModel.fromDocument(elem));
      }
      return retVal;
    }));
  }

  followUser(String uid) async {
        profileController.updateUserId(uid);

    profileController.followUser();
  }

  allUsers() async {
    _searchedUsers.bindStream(
        firestore.collection('users').snapshots().map((QuerySnapshot query) {
      List<AppUserModel> retVal = [];
      for (var elem in query.docs) {
        retVal.add(AppUserModel.fromDocument(elem));
      }
      return retVal;
    }));
  }
}
