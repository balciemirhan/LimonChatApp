import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:limon_chat_app/config/constant/themes/mediaquery.dart';
import 'package:limon_chat_app/config/constant/themes/text.dart';

import 'package:limon_chat_app/widgets/auth_button.dart';
import 'package:limon_chat_app/widgets/my_textformfield.dart';
import 'package:limon_chat_app/widgets/snackbar_widget.dart';

// formu güğncellemek için StatefulWidget olmak zorunda
class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key, required this.formkey}) : super(key: key);

  final GlobalKey<FormState> formkey;

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  // register method

  Future register(context) async {
    // kayıt düğmesine tıkladığımızda yapmak istediklerimiz:
    // get auth service:

    String message;

    if (passwordController.text.trim() ==
        confirmPasswordController.text.trim()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } else {
      message = "Parolalar Eşleşmiyor";
      return snackBarWidget(context, message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formkey,
      child: Column(
        children: [
          MyTextFormField(
            controller: emailController,
            hintText: AppText.email,
            prefixIcon: const Icon(Icons.email_outlined),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppText.validEmail;
              }

              return null;
            },
          ),
          const SizedBox(height: 20),
          MyTextFormField(
            controller: passwordController,
            hintText: AppText.password,
            prefixIcon: const Icon(Icons.lock_outline),
            keyboardType: TextInputType.visiblePassword,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppText.validPassword;
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          MyTextFormField(
            controller: confirmPasswordController,
            hintText: AppText.confirmPassword,
            prefixIcon: const Icon(Icons.lock_outline),
            keyboardType: TextInputType.visiblePassword,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppText.validPassword;
              }
              return null;
            },
          ),
          Padding(
            padding: EdgeInsets.only(
                top: AppScreenSize.screenSize(context).height / 8),
            child: AuthButton(
                formKey: widget.formkey,
                auth: () => register(context),
                buttonString: AppText.registerButtonTitle),
          )
        ],
      ),
    );
  }
}
