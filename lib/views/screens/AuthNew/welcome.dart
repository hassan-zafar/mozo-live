import 'package:flutter/material.dart';
import 'package:mozolive/Components/custom_text_button.dart';
import 'package:mozolive/Theme/colors.dart';
import 'package:mozolive/utilities/custom_unicorn_button.dart';
import 'package:mozolive/views/screens/AuthNew/Login/UI/login_page.dart';
import 'package:mozolive/views/screens/AuthNew/Registration/UI/register_page.dart';

class WelcomescreenWidget extends StatelessWidget {
  const WelcomescreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator WelcomescreenWidget - FRAME
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/splash_screen.gif',
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 100,
            left: 10,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomTextButton(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ));
                },
                text: 'Login',
                isGradient: true,
              ),
            ),
          ),
          Positioned(
            bottom: 100,
            right: 10,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: MyOutlinedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => RegisterPage(),
                  ));
                  // Navigator.of(context).push(MaterialPageRoute(
                  //   builder: (context) => const HomeNewUserFollowPage(),
                  // ));
                },
                gradient: LinearGradient(colors: [btnGradLeft, btnGradRight]),
                child: Text(
                  'Sign Up',
                  style: TextStyle(color: btnGradLeft, fontSize: 20),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
