import 'package:flutter/material.dart';
import 'package:limon_chat_app/config/constant/themes/mediaquery.dart';
import 'package:limon_chat_app/config/constant/themes/neu_box.dart';
import 'package:limon_chat_app/config/constant/themes/text.dart';
import 'package:limon_chat_app/config/constant/themes/text_style.dart';
import 'package:limon_chat_app/pages/login/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key, this.onTap}) : super(key: key);

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
              top: AppScreenSize.screenSize(context).height / 5),
          child: Column(
            children: [
              Center(
                child: NeuBox(
                  width: AppScreenSize.screenSize(context).height / 7,
                  height: AppScreenSize.screenSize(context).height / 7,
                  child: const Image(
                      image: AssetImage("assets/images/chat.png"),
                      fit: BoxFit.cover),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: AppScreenSize.screenSize(context).height / 8),
                child: LoginForm(formkey: formKey),
              ),

              // login Button
              Padding(
                padding: EdgeInsets.only(
                    top: AppScreenSize.screenSize(context).height / 8),
                child: loginButton(context, formKey, AppText.loginButtonTitle),
              ),

              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      AppText.member,
                      style: AppTextStyle.notMember,
                    ),
                    InkWell(
                      onTap: onTap,
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

Widget loginButton(
  BuildContext context,
  GlobalKey<FormState> formkey,
  String buttonText,
) {
  return GestureDetector(
    onTap: () {
      bool result = formkey.currentState!.validate();
      if (result) {
        formkey.currentState!.save();
        /*  login(index)(context);  */
        Navigator.of(context).pushNamed("/home");

        // Form geçerliyse, verileri gönderin.
        // submit butonu ile backEnd'e kaydedip verileri göndereceğim.
        // submit();
      }
    },
    child: NeuBox(
      width: AppScreenSize.screenSize(context).width * 0.8,
      height: AppScreenSize.screenSize(context).height * 0.08,
      child: Container(
        child: Center(
          child: Text(
            buttonText,
            style: AppTextStyle.body1,
          ),
        ),
      ),
    ),
  );
}
