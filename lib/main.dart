// import 'package:chat_app/services/navigation_services.dart';
import 'package:chat_app/pages/login_page.dart';
import 'package:chat_app/pages/splash_page.dart';
import 'package:chat_app/providers/authentication_provider.dart';
import 'package:chat_app/services/navigation_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// //Packages

// import 'package:provider/provider.dart';

// //Services

// //Providers
// import './providers/authentication_provider.dart';

// //Pages
// import './pages/splash_page.dart';
// import './pages/login_page.dart';

// void main() {
//   runApp(
//     SplashPage(
//       key: UniqueKey(),
//       onInitializationComplete: () {
//         runApp(
//           MainApp(),
//         );
//       },
//     ),
//   );
// }


void main() {
  runApp(SplashPage(
      key: UniqueKey(),
      onInitializationComplete: () {
        runApp(
          MainApp(),
        );
      }));
}


class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthenticationProvider>(
          create: (BuildContext _context) {
            return AuthenticationProvider();
          },
        )
      ],
      child: MaterialApp(
        title: 'Chatify',
        theme: ThemeData(
          backgroundColor: Color.fromRGBO(36, 35, 49, 1.0),
          scaffoldBackgroundColor: Color.fromRGBO(36, 35, 49, 1.0),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Color.fromRGBO(30, 29, 37, 1.0),
          ),
        ),
        navigatorKey: NavigationServices.navigatorKey,
        initialRoute: '/login',
        routes: {
          '/login': (BuildContext _context) => LoginPage(),
          // '/register': (BuildContext _context) => RegisterPage(),
          // '/home': (BuildContext _context) => HomePage(),
        },
      ),
    );
  }
 }

// 

// class MainApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Chatify',
//       theme: ThemeData(
//         backgroundColor: Color.fromRGBO(36, 35, 49, 1.0),
//         scaffoldBackgroundColor: Color.fromRGBO(36, 35, 49, 1.0),
//         bottomNavigationBarTheme: BottomNavigationBarThemeData(
//           backgroundColor: Color.fromRGBO(30, 29, 37, 1.0),
//         ),
//       ),
//       navigatorKey: NavigationServices.navigatorKey,
//       initialRoute:  '/login',
//       routes: {
//         '/login':((BuildContext _context )=> LoginPage())
//       },
//     );
//   }
// }
// }
