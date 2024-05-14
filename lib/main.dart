import 'package:flutter/material.dart';
import 'package:ssen_user/responsive.dart';
import 'package:ssen_user/screens/partial%20screen/purchase.dart';
import 'package:ssen_user/screens/post_share_secondary.dart';
import 'package:ssen_user/screens/setting.dart';
import 'package:ssen_user/services/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Synergy Share Exchange Network',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: SappTheme.lightTheme,
      darkTheme: SappTheme.darkTheme,

      // home: const About(),
      // home: const Announcment(),

      // home: const TermAndCondition(),
      // home: MainPage(),

      // home: SignUp(),

      // home: Responsive(),
      // home: PostShareSecondary(),
      // home: Purchase(),
      // home: const TermAndCondition(),

      // home: DesktopResponsive(),
      // home: PostShareSecondary(),
      // home: Purchase(),
      // home: Intermediate(),
      // home: SearchScreen(),

      // home: PostShareSecondary(),
      // home: const Subscribers(),
      // home: UserProfile(),

      // home: LoginScreen(),

      // home: HistoryWidget(),
      // home: History(),
      // home: Subscribers(),
      // home: CompanyProfileWidget(),
      home: Responsive(),

      // home: Responsive(),
      // home: AnnouncementDetail(),
      // home: SecondaryProfileWidget(),
      // home: Faq(),
      // home: HistoryDetail(),
      // home: FaqElementWidget(),
      // home: ShareDetail(),
      // home: SecondaryUserProfile(),
      // home: Payment_preview(),
      // home: DonationDetail(),
      // home: LoginScreen(),
      // home: SignUp(),
    );
  }
}
