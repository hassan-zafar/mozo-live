import 'package:flutter/material.dart';
import '../../../Routes/routes.dart';
import 'Login/UI/login_page.dart';
import 'Registration/UI/register_page.dart';
import 'SocialLogin/social_login.dart';
import 'Verification/UI/verification_page.dart';
GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class LoginRoutes {
  static const String loginRoot = 'login/';
  static const String registration = 'login/registration';
  static const String verification = 'login/verification';
  static const String socialLogin = 'login/social_login';
}

class LoginNavigator extends StatelessWidget {
  const LoginNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        var canPop = navigatorKey.currentState!.canPop();
        if (canPop) {
          navigatorKey.currentState!.pop();
        }
        return !canPop;
      },
      child: Navigator(
        key: navigatorKey,
        initialRoute: LoginRoutes.loginRoot,
        onGenerateRoute: (RouteSettings settings) {
          late WidgetBuilder builder;
          builder = (BuildContext _) => const LoginPage();
          switch (settings.name) {
          //   case LoginRoutes.loginRoot:
          //     builder = (BuildContext _) => const LoginPage();
          //     break;
          //   case LoginRoutes.registration:
          //     builder = (BuildContext _) => RegisterPage();
          //     break;
          //   case LoginRoutes.verification:
          //     builder = (BuildContext _) => VerificationPage(
          //           () {
          //             Navigator.popAndPushNamed(
          //                 context, PageRoutes.bottomNavigation);
          //           },
          //         );
          //     break;
          //   case LoginRoutes.socialLogin:
          //     builder = (BuildContext _) => const SocialLogin();
          //     break;
          }
          return MaterialPageRoute(builder: builder, settings: settings);
        },
        onPopPage: (Route<dynamic> route, dynamic result) {
          return route.didPop(result);
        },
      ),
    );
  }
}
