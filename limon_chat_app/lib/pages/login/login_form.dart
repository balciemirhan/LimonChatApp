import 'package:flutter/material.dart';
import 'package:limon_chat_app/config/constant/themes/text.dart';
import 'package:limon_chat_app/widgets/my_textformfield.dart';

class LoginForm extends StatelessWidget {
  LoginForm({
    Key? key,
    required this.formkey,
  }) : super(key: key);

  final GlobalKey<FormState> formkey;

  final TextEditingController emailController = TextEditingController();

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
          const SizedBox(height: 15),
          buildPasswordFormField(),
        ],
      ),
    );
  }
}

Widget buildPasswordFormField() {
  bool isPasswordVisible = true;
  final TextEditingController passwordController = TextEditingController();
  return StatefulBuilder(
    builder: (context, setState) {
      return MyTextFormField(
        controller: passwordController,
        hintText: AppText.password,
        prefixIcon: const Icon(Icons.lock_outline),
        suffixIcon: IconButton(
          onPressed: () {
            setState(
              () {
                isPasswordVisible = !isPasswordVisible;
              },
            );
          },
          icon: isPasswordVisible
              ? const Icon(Icons.visibility_off_outlined)
              : const Icon(Icons.visibility_outlined),
        ),
        obscureText: isPasswordVisible,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return AppText.validPassword;
          }
          return null;
        },
        keyboardType: TextInputType.visiblePassword,
      );
    },
  );
}
