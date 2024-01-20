import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:limon_chat_app/rules/rules.dart';
import 'package:limon_chat_app/widgets/auth_button.dart';

import 'package:limon_chat_app/widgets/my_textformfield.dart';
import 'package:limon_chat_app/widgets/snackbar_widget.dart';

class ForgotForm extends StatefulWidget {
  const ForgotForm({Key? key, required this.formKey}) : super(key: key);
  final GlobalKey<FormState> formKey;

  @override
  State<ForgotForm> createState() => _ForgotFormState();
}

class _ForgotFormState extends State<ForgotForm> {
  final TextEditingController emailController = TextEditingController();

  Future<void> passwordReset(context) async {
    String message = "";
    {
      {
        try {
          await FirebaseAuth.instance
              .sendPasswordResetEmail(email: emailController.text.trim());
          message = "Şifre bağlantısı gönderildi! Lütfen e-postanı kontrol et.";
          snackBarWidget(context, message, color: Colors.green);
        } on FirebaseAuthException catch (e) {
          message = forgotPasswordRules(e, message, context);
        }
      }
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          const Text(
            textAlign: TextAlign.center,
            "Enter your Email And we will send you a password reset link",
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 25),
          MyTextFormField(
            hintText: "Email",
            prefixIcon: const Icon(Icons.email_outlined),
            controller: emailController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "email";
              }
              return null;
            },
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 25),
          AuthButton(
              formKey: widget.formKey,
              auth: () {
                return passwordReset(context);
              },
              buttonString: "Reset Password")
        ],
      ),
    );
  }
}
