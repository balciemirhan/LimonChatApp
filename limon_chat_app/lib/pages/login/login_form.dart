import 'package:flutter/material.dart';
import 'package:limon_chat_app/auth/auth_service.dart';
import 'package:limon_chat_app/config/constant/themes/mediaquery.dart';

import 'package:limon_chat_app/config/constant/themes/text.dart';
import 'package:limon_chat_app/pages/home_page.dart';

import 'package:limon_chat_app/widgets/auth_button.dart';
import 'package:limon_chat_app/widgets/my_textformfield.dart';

// StatefulWidget olmak zorunda formu güncelleye bilmek için:
class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
    required this.formkey,
  }) : super(key: key);

  final GlobalKey<FormState> formkey;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  // login method
/*   Future<void> login(BuildContext context) async {
    // get auth service:
    final authService = AuthService();

    // try login
    try {
      await authService.signInWithEmailAndPassword(
          emailController.text, passwordController.text);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } catch (e) {
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (context) => AlertDialog(title: Text(e.toString())),
      );
    }
    // catch any errors
  } */

  Future<void> login(BuildContext context) async {
    // get auth service:
    final authService = AuthService();

    // check if email is valid
    if (!RegExp(r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$")
        .hasMatch(emailController.text)) {
      // show error dialog
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Invalid email address"),
        ),
      );
      return;
    }

    // try login
    try {
      await authService.signInWithEmailAndPassword(
          emailController.text, passwordController.text);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } catch (e) {
      // show error dialog
      showDialog(
        context: context,
        builder: (context) => AlertDialog(title: Text(e.toString())),
      );
    }
  }

/* Form widget'ı, içindeki tüm FormField widget'larını takip eder ve bu alanların geçerliliğini kontrol eder. FormField widget'ları, validator özelliği ile geçerlilik kontrolü yapabilirler. */
  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.always,
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
          const SizedBox(height: 15),
          buildPasswordFormField(),
          Padding(
            padding: EdgeInsets.only(
                top: AppScreenSize.screenSize(context).height / 8),
            child: AuthButton(
                formKey: widget.formkey,
                auth: (context) => login(context),
                buttonString: AppText.loginButtonTitle),
          ),
        ],
      ),
    );
  }

  Widget buildPasswordFormField() {
    bool isPasswordVisible = true;

    return StatefulBuilder(
      builder: (context, setState) {
        return MyTextFormField(
          controller: passwordController, // Use the controller here
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
}
