import 'package:flutter/material.dart';
import 'package:limon_chat_app/config/constant/themes/neu_box.dart';

class SquareAuthButton extends StatelessWidget {
  const SquareAuthButton({Key? key, this.onTap, required this.imagePath})
      : super(key: key);

  final String imagePath;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: NeuBox(
        width: 70,
        height: 70,
        child: Container(
          child: Center(
            child: Image(
              image: AssetImage(imagePath),
              height: 40,
            ),
          ),
        ),
      ),
    );
  }
}
