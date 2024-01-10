import 'package:flutter/material.dart';
import 'package:limon_chat_app/auth/auth_service.dart';
import 'package:limon_chat_app/config/constant/themes/mediaquery.dart';
import 'package:limon_chat_app/config/constant/themes/text.dart';
import 'package:limon_chat_app/widgets/auth_button.dart';
import 'package:limon_chat_app/widgets/my_textformfield.dart';

// formu güğncellemek için StatefulWidget olmak zorunda
class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key, required this.formkey}) : super(key: key);

  final GlobalKey<FormState> formkey;

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  // register method
  Future<void> register(BuildContext context) async {
    // kayıt düğmesine tıkladığımızda yapmak istediklerimiz:
    // get auth service:

    final AuthService authService = AuthService();

// şifremiz ve onaylanmış olan şifremiz eşleşirse o zaman kayıt olma işlemi gerçekleşsin.:
    // Kontrol et: Parola ile onay parolası eşleşiyor mu?
    if (passwordController.text == confirmPasswordController.text) {
      // Kontrol et: Parola en az 8 karakter uzunluğunda mı?
      if (passwordController.text.length >= 8) {
        try {
          // Firebase üzerinde kullanıcı oluştur
          authService.createUserWithEmailAndPassword(
              emailController.text, passwordController.text);

          // Başarılı olursa, kullanıcıyı giriş veya kayıt ekranına yönlendir
          Navigator.of(context).pushNamed("/loginOrRegister");
        } catch (e) {
          // Hata durumunda kullanıcıya hatayı göster
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(e.toString()),
            ),
          );
        }
      } else {
        // Parola 8 karakterden kısa ise kullanıcıya uyarı göster
        showDialog(
          context: context,
          builder: (context) => const AlertDialog(
            title: Text(
              "Password must be at least 8 characters long!",
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      }
    } else {
      // Parolalar eşleşmiyorsa kullanıcıya uyarı göster
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text(
            "Passwords don't match!",
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
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
                auth: (context) => register(context),
                buttonString: AppText.registerButtonTitle),
          )
        ],
      ),
    );
  }
}
