// import 'package:chat_app/pages/media_services.dart';
// import 'package:chat_app/services/colud_storage_services.dart';
// import 'package:chat_app/services/database_services.dart';
// import 'package:chat_app/services/navigation_services.dart';
import 'package:chat_app/services/colud_storage_services.dart';
import 'package:chat_app/services/media_services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../services/database_services.dart';
import '../services/navigation_services.dart';

// //Packages
// import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';

// //Services

class SplashPage extends StatefulWidget {
  final VoidCallback onInitializationComplete;

  const SplashPage({
    required Key key,
    required this.onInitializationComplete,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SplashPageState();
  }
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1)).then(
      (_) {
        _setup().then(
          (_) =>
          //  LoginPage()

          widget.onInitializationComplete(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chatify',
      theme: ThemeData(
        backgroundColor: Color.fromRGBO(36, 35, 49, 1.0),
        scaffoldBackgroundColor: Color.fromRGBO(36, 35, 49, 1.0),
      ),
      home: Scaffold(
        body: Center(
          child: Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.contain,
                image: AssetImage('assets/images/logo.png'),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _setup() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    _registerServices();
  }

  void _registerServices() {
    GetIt.instance.registerSingleton<NavigationServices>(
      NavigationServices(),
    );
    GetIt.instance.registerSingleton<MediaServices>(
      MediaServices(),
    );
    GetIt.instance.registerSingleton<CloudStorageServices>(
      CloudStorageServices(),
    );
    GetIt.instance.registerSingleton<DatabaseServices>(
      DatabaseServices(),
    );
  }
}












// class SplashPage extends StatefulWidget {
//   final VoidCallback onInitializationComplete;
//   const SplashPage({super.key, required this.onInitializationComplete});

//   @override
//   State<SplashPage> createState() => _SplashPageState();
// }

// class _SplashPageState extends State<SplashPage> {
//   @override
//   void initState() {
//     super.initState();
//     Future.delayed(Duration(seconds: 1)).then((_) {
//  _setup().then((_) => widget.onInitializationComplete);
//     });
   
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Chatify',
//       theme: ThemeData(
//         backgroundColor: Color.fromRGBO(36, 35, 49, 1.0),
//         scaffoldBackgroundColor: Color.fromRGBO(36, 35, 49, 1.0),
//       ),
//       home: Center(
//         child: Container(
//           height: 200,
//           width: 200,
//           decoration: const BoxDecoration(
//             image: DecorationImage(
//               fit: BoxFit.contain,
//               image: AssetImage('assets/images/logo.png'),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Future<void> _setup() async {
//     WidgetsFlutterBinding.ensureInitialized();
//     await Firebase.initializeApp(
//       // options: DefaultFirebaseOptions.currentPlatform,
//     );
//     _registerServices();
//   }

//   void _registerServices() {
//     GetIt.instance.registerSingleton<NavigationServices>(NavigationServices());

//     GetIt.instance.registerSingleton<MediaServices>(
//       MediaServices(),
//     );

//     GetIt.instance.registerSingleton<CloudStorageServices>(
//       CloudStorageServices(),
//     );
//     GetIt.instance.registerSingleton<DatabaseServices>(
//       DatabaseServices(),
//     );
//   }
// }
