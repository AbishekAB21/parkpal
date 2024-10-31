import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:parkpal/provider/authentication-provider.dart';
import 'package:parkpal/provider/bottom-nav-provider.dart';
import 'package:parkpal/provider/database-provider.dart';
import 'package:parkpal/provider/slot-provider.dart';
import 'package:parkpal/screens/splash-screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => AuthenticationProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => BottomNavProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => SlotProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => DatabaseProvider(),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: SplashScreen());
  }
}
