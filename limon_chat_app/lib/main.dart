import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:limon_chat_app/config/constant/themes/theme/light_mode.dart';
import 'package:limon_chat_app/config/routes/app_routes.dart';
import 'package:limon_chat_app/firebase_options.dart';

Future<void> main() async {
  // Firebase'in mevcut platform için uygulamayı başlatması:
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat App',
      debugShowCheckedModeBanner: false,

      // --------------------------- THEME ---------------------------

      theme: AppTheme.lightMode,

      // --------------------------- ROUTE ---------------------------
      initialRoute: AppRoute.authGate,
      routes: AppRoute.routes,
    );
  }
}
