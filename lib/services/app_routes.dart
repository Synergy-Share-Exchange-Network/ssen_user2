import 'package:flutter/material.dart';
import 'package:ssen_user/intermediate.dart';
import 'package:ssen_user/responsive.dart';
import 'package:ssen_user/screens/change%20email/confirm_account_change_email.dart';
import 'package:ssen_user/screens/change%20email/enter_new_password.dart';
import 'package:ssen_user/screens/change%20password/confirm_account.dart';
import 'package:ssen_user/screens/change%20password/enter_new_password.dart';
import 'package:ssen_user/screens/login.dart';
import 'package:ssen_user/screens/signup.dart';
import 'package:ssen_user/screens/state%20pages/main_page.dart';
import 'package:ssen_user/screens/terms%20and%20condition.dart';

import '../screens/about.dart';
import '../screens/setting.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case EnterNewPassword.route:
        return MaterialPageRoute(builder: (_) => const EnterNewPassword());
      case ConfirmAccount.route:
        return MaterialPageRoute(builder: (_) => const ConfirmAccount());
      // case TermAndCondition.route:
      // return MaterialPageRoute(builder: (_) => const TermAndCondition());
      case EnterNewEmail.route:
        return MaterialPageRoute(builder: (_) => const EnterNewEmail());
      case TermsAndConditionsPage.route:
        return MaterialPageRoute(builder: (_) => TermsAndConditionsPage());
      // case EnterNewEmail.route:
      //   return MaterialPageRoute(builder: (_) => const EnterNewEmail());
      case AboutUs.route:
        return MaterialPageRoute(builder: (_) => AboutUs());
      case Setting.route:
        return MaterialPageRoute(builder: (_) => const Setting());
      case ConfirmAccountChangeEmail.route:
        return MaterialPageRoute(
            builder: (_) => const ConfirmAccountChangeEmail());
      case Intermediate.route:
        return MaterialPageRoute(builder: (_) => const Intermediate());
      case Responsive.route:
        return MaterialPageRoute(builder: (_) => const Responsive());
      case Signup.route:
        return MaterialPageRoute(builder: (_) => const Signup());
      case Login.route:
        return MaterialPageRoute(builder: (_) => const Login());
      case MainPage.route:
        return MaterialPageRoute(builder: (_) => const MainPage());
      default:
        return null;
    }
  }
}
