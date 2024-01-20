import 'package:flutter/material.dart';
import 'package:limon_chat_app/config/constant/themes/mediaquery.dart';
import 'package:limon_chat_app/config/constant/themes/neu_box.dart';

class MyTextFormField extends StatelessWidget {
  const MyTextFormField({
    Key? key,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText,
    this.controller,
    this.validator,
    this.onSaved,
    this.keyboardType,
  }) : super(key: key);

  final TextEditingController? controller;
  final Icon? prefixIcon;
  final IconButton? suffixIcon;
  final String hintText;
  final bool? obscureText;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return NeuBox(
      width: AppScreenSize.screenSize(context).width * 0.8,
      height: AppScreenSize.screenSize(context).height * 0.08,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: TextFormField(
          keyboardType: keyboardType,
          onSaved: onSaved,
          validator: validator,
          controller: controller,
          obscureText: obscureText ?? false,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.tertiary,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            fillColor: Theme.of(context).colorScheme.secondary,
            filled: true,
            hintText: hintText,
            hintStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
          ),
        ),
      ),
    );
  }
}
