
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:mozolive/controllers/auth_controller.dart';
import 'package:mozolive/models/user.dart';
import 'package:mozolive/views/screens/Activity/activity_page.dart';
import 'package:mozolive/views/screens/Home/home_page.dart';
import 'package:mozolive/views/screens/add_video_screen.dart';
import 'package:mozolive/views/screens/profile_screen.dart';
import 'package:mozolive/views/screens/search_screen.dart';
import 'package:mozolive/views/screens/video_screen.dart';

AppUserModel? currentUser;
String logo = 'assets/images/Logo_white.png';
List pages = [
HomePage() ,
 SearchScreen(),
  const AddVideoScreen(),
  ActivityPage(),
  ProfileScreen(uid: authController.user.uid),
];

// COLORS
const backgroundColor = Colors.black;
var buttonColor = Color(0xff065900);
const borderColor = Colors.grey;

// FIREBASE
var firebaseAuth = FirebaseAuth.instance;
var firebaseStorage = FirebaseStorage.instance;
var firestore = FirebaseFirestore.instance;

// CONTROLLER
var authController = AuthController.instance;
