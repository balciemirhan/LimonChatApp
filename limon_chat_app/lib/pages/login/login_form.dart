import 'package:flutter/material.dart';
import 'package:limon_chat_app/auth/auth_service.dart';
import 'package:limon_chat_app/config/constant/themes/mediaquery.dart';

import 'package:limon_chat_app/config/constant/themes/text.dart';

import 'package:limon_chat_app/widgets/auth_button.dart';
import 'package:limon_chat_app/widgets/my_textformfield.dart';

class LoginForm extends StatelessWidget {
   LoginForm({
    Key? key,
    required this.formkey,
  }) : super(key: key);

  final GlobalKey<FormState> formkey;

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  // login method
  Future<void> login(BuildContext context) async {
    // giriş düğmesine tıkladığımızda yapmak istediklerimiz:
    // get auth service:

    final authService = AuthService();

    // try login

    try {
      await authService.signInWithEmailAndPassword(
          emailController.text, passwordController.text);
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(title: Text(e.toString())),
      );
    }
    // catch any errors
  }

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
          Padding(
            padding: EdgeInsets.only(
                top: AppScreenSize.screenSize(context).height / 8),
            child: AuthButton(
                formKey: formkey,
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

/*   Widget buildLoginButton(
    BuildContext context,
    GlobalKey<FormState> formkey,
    String buttonText,
  ) {
    return GestureDetector(
      onTap: () {
        bool result = formkey.currentState!.validate();
        if (result) {
          formkey.currentState!.save();
          login(context);

          /*  Navigator.of(context).pushNamed("/home");
 */
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
  } */
}
