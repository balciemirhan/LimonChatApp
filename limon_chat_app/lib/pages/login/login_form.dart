import 'package:flutter/material.dart';
import 'package:limon_chat_app/services/auth/auth_service.dart';
import 'package:limon_chat_app/config/constant/themes/mediaquery.dart';
import 'package:limon_chat_app/config/constant/themes/text.dart';
import 'package:limon_chat_app/main.dart';
import 'package:limon_chat_app/widgets/auth_button.dart';
import 'package:limon_chat_app/widgets/my_textformfield.dart';
import 'package:limon_chat_app/widgets/show_dialog_widget.dart';

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
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  Future<void> login(context) async {
    // get auth service:
    final authService = AuthService();

    showDialogWidget(context);

    try {
      // create user

      // try login
      await authService.signInWithEmailAndPassword(
          emailController.text.trim(), passwordController.text.trim());

          // save user info in a separete doc
          
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(title: Text(e.toString())),
      );
    }
    navigatorKey.currentState!.pop();
    /*   navigatorKey.currentState!.popUntil((route) => route.isFirst); */
  }

/* Form widget'ı, içindeki tüm FormField widget'larını takip eder ve bu alanların geçerliliğini kontrol eder. FormField widget'ları, validator özelliği ile geçerlilik kontrolü yapabilirler. */
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
          const SizedBox(height: 15),
          buildPasswordFormField(),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () => Navigator.pushNamed(context, "/forgotPassword"),
                  child: const Text("Forgot Password?"),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: AppScreenSize.screenSize(context).height / 20),
            child: AuthButton(
                formKey: widget.formkey,
                auth: () => login(context),
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
