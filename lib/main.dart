import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ssen_user/firebase_options.dart';
import 'package:ssen_user/intermediate.dart';
import 'package:ssen_user/provider/user_provider.dart';

import 'package:ssen_user/responsive.dart';
import 'package:ssen_user/screens/about.dart';
import 'package:ssen_user/screens/components/announcement.dart';
import 'package:ssen_user/screens/components/home.dart';
import 'package:ssen_user/screens/components/subscribers.dart';

import 'package:ssen_user/screens/login.dart';
import 'package:ssen_user/screens/partial%20screen/purchase.dart';
import 'package:ssen_user/screens/profile.dart';

import 'package:ssen_user/services/app_routes.dart';
import 'package:ssen_user/services/theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.appRouter}) : super(key: key);

  final AppRouter appRouter;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => UserProvider())],
      child: MaterialApp(
        title: 'Synergy Share Exchange Network',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        theme: SappTheme.lightTheme,
        darkTheme: SappTheme.darkTheme,

        // home: const About(),
        // home: const Responsive(),
        // home: EnterNewPassword(),
        // home: Announcment(),

        // home: const TermAndCondition(),
        // home: MainPage(),

        // home: SignUp(),

        // home: HomePage(),
        // home: Companyprofile(),
        // home: Purchase(),
        // home: const TermAndCondition(),
        // home: Responsive(),``
        // home: CompanyDetail(),
        // home: DesktopResponsive(),
        // home: Login(),
        // home: SearchScreen(),

        // home: PostShareSecondary(),
        // home: const Subscribers(),
        // home: Purchase(),
        // home: UserProfile(),

        // home: LoginScreen(),

        // home: HistoryWidget(),
        // home: Subscribers(),
        // home: CompanyProfileWidget(),
        // home: LogOutScreen()
        home: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot?.connectionState == ConnectionState.active) {
                if (snapshot.hasData) {
                  return const Responsive();
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('${snapshot.error}'),
                  );
                }
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(color: Colors.blue),
                );
              }
              return const Login();
            }),

        onGenerateRoute: appRouter.onGenerateRoute,
      ),
    );
  }
}
