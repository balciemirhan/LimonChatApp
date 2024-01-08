import 'package:flutter/material.dart';
import 'package:limon_chat_app/config/constant/themes/text.dart';
import 'package:limon_chat_app/widgets/my_textformfield.dart';

class RegisterForm extends StatelessWidget {
  RegisterForm({Key? key, required this.formkey}) : super(key: key);
  final GlobalKey<FormState> formkey;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
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
        ],
      ),
    );
  }
}
