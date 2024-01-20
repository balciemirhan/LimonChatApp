import 'package:flutter/material.dart';
import 'package:limon_chat_app/pages/forgot/forgot_form.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({Key? key}) : super(key: key);

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ForgotForm(formKey: formkey),
          ],
        ),
      ),
    );
  }
}
