import 'package:flutter/material.dart';
import 'package:limon_chat_app/config/constant/themes/mediaquery.dart';
import 'package:limon_chat_app/config/constant/themes/text.dart';
import 'package:limon_chat_app/config/constant/themes/text_style.dart';
import 'package:limon_chat_app/pages/login/login_page.dart';
import 'package:limon_chat_app/pages/register/register_form.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        width: double.infinity,
        height: size.height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: Image(
                width: size.width * 1.1,
                image: const AssetImage("assets/images/decor_top.png"),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Image(
                width: size.width * 1,
                image: const AssetImage("assets/images/decor_bottom.png"),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: AppScreenSize.screenSize(context).height / 12,
                  width: double.infinity,
                  /* color: Colors.red */
                ),
                RegisterForm(formkey: formKey),
                Padding(
                  padding: EdgeInsets.only(
                      top: AppScreenSize.screenSize(context).height / 8),
                  child: loginButton(
                      context, formKey, AppText.registerButtonTitle),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        AppText.already,
                        style: AppTextStyle.notMember,
                      ),
                      InkWell(
                        onTap: () => Navigator.of(context).pushNamed("/login"),
                        child: const Text(
                          AppText.loginNow,
                          style: AppTextStyle.registerNow,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
