import 'package:flutter/material.dart';
import 'package:limon_chat_app/config/constant/themes/mediaquery.dart';
import 'package:limon_chat_app/config/constant/themes/neu_box.dart';
import 'package:limon_chat_app/config/constant/themes/text_style.dart';

class AuthButton extends StatelessWidget {
  const AuthButton(
      {Key? key,
      required this.formKey,
      required this.auth,
      required this.buttonString})
      : super(key: key);

  final GlobalKey<FormState> formKey;
  final String buttonString;
  final Future<void> Function() auth;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        bool result = formKey.currentState!.validate();
        if (result) {
          formKey.currentState!.save();
          auth();

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
              buttonString,
              style: AppTextStyle.body1,
            ),
          ),
        ),
      ),
    );
  }
}
