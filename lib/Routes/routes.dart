import 'package:flutter/material.dart';

class PageRoutes {
  static const String loginNavigator = 'login_navigator';
  static const String bottomNavigation = 'bottom_navigation';
  static const String followersPage = 'followers_page';
  static const String helpPage = 'help_page';
  static const String tncPage = 'tnc_page';
  static const String searchPage = 'search_page';
  static const String addVideoPage = 'add_video_page';
  static const String addVideoFilterPage = 'add_video_filter_page';
  static const String postInfoPage = 'post_info_page';
  static const String userProfilePage = 'user_profile_page';
  static const String chatPage = 'chat_page';
  static const String morePage = 'more_page';
  static const String videoOptionPage = 'video_option_page';
  static const String verifiedBadgePage = 'verified_badge_page';
  static const String languagePage = 'language_page';

  Map<String, WidgetBuilder> routes() {
    return {
      // loginNavigator: (context) => const LoginNavigator(),
      // bottomNavigation: (context) => const BottomNavigation(),
      // followersPage: (context) => const FollowersPage(),
      // helpPage: (context) => const HelpPage(),
      // tncPage: (context) => const TnC(),
      // searchPage: (context) => const SearchUsers(),
      // addVideoPage: (context) => const AddVideo(),
      // addVideoFilterPage: (context) => const AddVideoFilter(),
      // postInfoPage: (context) => const PostInfo(),
      // userProfilePage: (context) => const UserProfilePage(),
      // chatPage: (context) => const ChatPage(),
      // morePage: (context) => const MorePage(),
      // videoOptionPage: (context) => const VideoOptionPage(),
      // verifiedBadgePage: (context) => const BadgeRequest(),
      // languagePage: (context) => const ChangeLanguagePage(),
    };
  }
}
