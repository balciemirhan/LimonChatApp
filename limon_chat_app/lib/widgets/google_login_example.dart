
/* // Import the necessary libraries.
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

// Create an instance of the Google sign in service.
final GoogleSignIn googleSignIn = GoogleSignIn();

// Create an instance of the Firebase authentication service.
final FirebaseAuth auth = FirebaseAuth.instance;

// Function to sign in with Google.
Future<User?> signInWithGoogle() async {
  // Trigger the authentication flow.
  final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

  // If the user is not signed in, return null.
  if (googleUser == null) {
    return null;
  }

  // Obtain the auth details from the request.
  final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

  // Create a new credential using the auth details.
  final OAuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );

  // Sign in with the credential.
  final UserCredential userCredential = await auth.signInWithCredential(credential);

  // Return the signed in user.
  return userCredential.user;
}
 */