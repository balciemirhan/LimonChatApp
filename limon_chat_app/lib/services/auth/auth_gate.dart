import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:limon_chat_app/rules/rules.dart';

// dinleyici --> kullanıcı'nın giriş yapıp yapmadığını kontrol edeceğim.

// gerçek zamanlı veri değişikliklerine yanıt verir ==> StreamBuilder

/* 'AuthGate' widget'ı, bir kullanıcının Firebase Authentication'ı kullanarak oturum açıp açmadığını belirlemek için bir ağ geçidi denetleyicisi görevi görecek şekilde tasarlanmıştır. Kimlik doğrulama durumundaki değişiklikleri dinlemek için bir "StreamBuilder" kullanır ve bir kullanıcının kimliğinin doğrulanıp doğrulanmadığına bağlı olarak koşullu olarak "Ana Sayfa" veya "LoginOrRegister" widget'ını görüntüler.  */
class AuthGate extends StatefulWidget {
  const AuthGate({Key? key}) : super(key: key);

  @override
  State<AuthGate> createState() => _AuthGateState();
}

//  bir ağ geçidi denetleyicisi
class _AuthGateState extends State<AuthGate> {
// snapshot.hasData =  akışın boş olmayan bir değer yayıp yaymadığını kontrol ediyor. true / false = StreamBuilder sınıfından geliyor. Kimliği doğrulanmış / doğrulanmamış.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          return firebaseAuthConditions(snapshot);
        },
      ),
    );
  }
}
