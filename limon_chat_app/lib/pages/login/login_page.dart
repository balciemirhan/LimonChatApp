import 'package:flutter/material.dart';
import 'package:limon_chat_app/services/auth/google_authentication.dart';
import 'package:limon_chat_app/config/constant/themes/mediaquery.dart';
import 'package:limon_chat_app/config/constant/themes/neu_box.dart';
import 'package:limon_chat_app/config/constant/themes/text.dart';
import 'package:limon_chat_app/config/constant/themes/text_style.dart';
import 'package:limon_chat_app/pages/login/login_form.dart';
import 'package:limon_chat_app/widgets/square_auth_button.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key, this.onTap}) : super(key: key);

  final void Function()? onTap;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
              top: AppScreenSize.screenSize(context).height / 8),
          child: Column(
            children: [
              // -------------------- LOGO --------------------
              Center(
                child: NeuBox(
                  width: AppScreenSize.screenSize(context).height / 7,
                  height: AppScreenSize.screenSize(context).height / 7,
                  child: const Image(
                      image: AssetImage("assets/images/chat.png"),
                      fit: BoxFit.cover),
                ),
              ),

              // -------------------- FORM --------------------

              Padding(
                padding: EdgeInsets.only(
                    top: AppScreenSize.screenSize(context).height / 12),
                child: LoginForm(formkey: formKey),
              ),

              // -------------------- Divider --------------------

              Padding(
                padding: const EdgeInsets.all(50),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Or Continue With",
                        style: TextStyle(
                          color: Colors.grey[700],
                        ),
                      ),
                    ),
                    Expanded(
                        child: Divider(
                      thickness: 0.5,
                      color: Colors.grey[400],
                    ))
                  ],
                ),
              ),

              // -------------------- Square Auth Button --------------------

              // GoogleAuthentication --> kimlik doğrulama hizmeti.
              SquareAuthButton(
                onTap: () => GoogleAuthentication().signInWithGoogle(),
                imagePath: "assets/images/google_icon.png",
              ),

              const SizedBox(height: 30),
              // -------------------- Register Now --------------------

              Padding(
                padding: const EdgeInsets.only(bottom: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      AppText.member,
                      style: AppTextStyle.notMember,
                    ),
                    InkWell(
                      onTap: () {
                        onTap!();
                      },
                      child: const Text(
                        AppText.registerNow,
                        style: AppTextStyle.registerNow,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
