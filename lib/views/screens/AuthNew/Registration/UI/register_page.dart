import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mozolive/Components/custom_button_inter.dart';
import 'package:mozolive/Components/custom_text_button.dart';
import 'package:mozolive/Components/entry_field.dart';
import 'package:mozolive/Constants/constants.dart';
import 'package:mozolive/DatabaseMethods/auth_methods.dart';
import 'package:mozolive/DatabaseMethods/user_api.dart';
import 'package:mozolive/Routes/routes.dart';
import 'package:mozolive/Theme/colors.dart';
import 'package:mozolive/models/user.dart';
import 'package:mozolive/utilities/custom_toast.dart';
import 'package:mozolive/utilities/show_loading.dart';

//register page for registration of a new user
class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _name = TextEditingController();

  final TextEditingController _email = TextEditingController();

  final TextEditingController _password = TextEditingController();

  final TextEditingController _confirmPassword = TextEditingController();

  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  void _submitForm() async {
    if (_key.currentState!.validate()) {
      if (_password.text.trim() == _confirmPassword.text.trim()) {
        showLoadingDialog(context);
        FocusScope.of(context).unfocus();
        final User? _user = await AuthMethod().signupWithEmailAndPassword(
          email: _email.text,
          password: _password.text,
        );
        if (_user == null) {
          Navigator.of(context).pop();
          return;
        }
        String date = DateTime.now().toString();
        DateTime dateparse = DateTime.parse(date);
        String formattedDate =
            '${dateparse.day}-${dateparse.month}-${dateparse.year}';
        String _imageURL = '';
        // if (_pickedImage != null) {
        //   _imageURL =
        //       await UserAPI().uploadImage(File(_pickedImage!.path), _user.uid);
        // }
        AppUserModel _appUser = AppUserModel(
          uid: _user.uid,
          name: _name.text.trim(),
          email: _email.text.trim(),
          isAdmin: false,
         profilePhoto: '', 
        );
        final bool _save = await UserAPI().addUser(_appUser);
        if (_save) {
          CustomToast.successToast(message: 'Signup successfully');
           Navigator.of(context).pushNamedAndRemoveUntil(
                            PageRoutes.bottomNavigation,
                            (Route<dynamic> route) => false,
                          );
        } else {
          Navigator.of(context).pop();
        }
      } else {
        CustomToast.errorToast(
          message: 'Password and confirm password should be same',
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Row(
          children: const [
            Icon(Icons.arrow_back_ios_sharp),
          ],
        ),
      ),

      //this column contains 3 textFields and a bottom bar
      body: SingleChildScrollView(
        child: Form(
          key: _key,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.end,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                "Create account",
                // textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(color: lightTextColor),
              ),

              //name textField

              EntryField(
                controller: _email,
                textCapitalization: TextCapitalization.words,
                label: 'Email@yourmail.com',
                keyboardType: TextInputType.emailAddress,
              ),
              //email textField
              EntryField(
                controller: _password,
                textCapitalization: TextCapitalization.none,
                label: 'Password',
              ),

              //phone textField
              EntryField(
                controller: _confirmPassword,
                textCapitalization: TextCapitalization.none,
                label: 'Re-type Your Password',
              ),

              //continue button
              CustomTextButton(
                  text: 'Start Your Account',
                  isGradient: true,
                  onTap: () =>authController.registerUser(
                  _name.text,
                  _email.text,
                  _password.text,
                  authController.profilePhoto,
                )
                  //  _submitForm()
                  
                  ),
              const Text(
                'Or',
                textAlign: TextAlign.center,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // CustomTextButtonIntr(
                  //     width: 140,
                  //     text: 'Facebook',
                  //     isGradient: false,
                  //     color: const Color(0xff1E81C9),
                  //     onTap: () {
                  //     Navigator.of(context).pushNamedAndRemoveUntil(
                  //           PageRoutes.bottomNavigation,
                  //           (Route<dynamic> route) => false,
                  //         );
                  //     }),
                  CustomTextButtonIntr(
                      text: 'Google',
                      width: 140,
                      color: Colors.green,
                      isGradient: false,
                      onTap: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                            PageRoutes.bottomNavigation,
                            (Route<dynamic> route) => false,
                          );
                      }),
                ],
              )
            ],
          ),
        ),
      ),
      // FadedSlideAnimation(
      //   child: const RegisterForm(),
      //   beginOffset: const Offset(0, 0.3),
      //   endOffset: const Offset(0, 0),
      //   slideCurve: Curves.linearToEaseOut,
      // ),
    );
  }
}
