import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthentication {
  Future<dynamic> signInWithGoogle() async {
    // begin interactive sign in process --->
    // e posta seçmeme olanak tanıyacak.
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    // obtaiin auth details from request --->
    // e postayı içe aktarma
    // kimlik doğrulama ==> gAuth
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    // create a new credential for user --->
    // işlem tamamlandıktan sonra kimlik bilgisi oluşturalım.
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken, // erişim belirteci
      idToken: gAuth.idToken, // kimlik belirteci
    );

    // finally, lets sign in --->
    // ve son olarak kimlik bilgisine sahip olduğumuzda,
    // sadece oturum açmak için Firebase yönetimini kullanmamız gerekiyor.

    return await FirebaseAuth.instance.signInWithCredential(credential);

    // en son işlem firebase tarafında kimlik doğrulama ve imzalama.
  }
}
