import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:limon_chat_app/auth/login_or_register.dart';
import 'package:limon_chat_app/pages/home_page.dart';

// dinleyici --> kullanıcı'nın giriş yapıp yapmadığını kontrol edeceğim.

/* 'AuthGate' widget'ı, bir kullanıcının Firebase Authentication'ı kullanarak oturum açıp açmadığını belirlemek için bir ağ geçidi denetleyicisi görevi görecek şekilde tasarlanmıştır. Kimlik doğrulama durumundaki değişiklikleri dinlemek için bir "StreamBuilder" kullanır ve bir kullanıcının kimliğinin doğrulanıp doğrulanmadığına bağlı olarak koşullu olarak "Ana Sayfa" veya "LoginOrRegister" widget'ını görüntüler.  */
class AuthGate extends StatefulWidget {
  const AuthGate({Key? key}) : super(key: key);

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
// snapshot.hasData =  akışın boş olmayan bir değer yayıp yaymadığını kontrol ediyor. true / false = StreamBuilder sınıfından geliyor. Kimliği doğrulanmış / doğrulanmamış.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          // user in logged in
          if (snapshot.hasData) { 
            return const HomePage();
          }

          // user is NOT logged in
          return const LoginOrRegister();
        },
      ),
    );
  }
}
