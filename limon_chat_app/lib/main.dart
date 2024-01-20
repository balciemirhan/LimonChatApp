import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:limon_chat_app/config/constant/themes/theme/theme_provider.dart';
import 'package:limon_chat_app/config/routes/app_routes.dart';
import 'package:limon_chat_app/firebase_options.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  // Firebase'in mevcut platform için uygulamayı başlatması:
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Chat App',
      debugShowCheckedModeBanner: false,

      // --------------------------- THEME ---------------------------

      theme: Provider.of<ThemeProvider>(context).themeData,

      // --------------------------- ROUTE ---------------------------
      initialRoute: AppRoute.authGate,
      routes: AppRoute.routes,
    );
  }
}
