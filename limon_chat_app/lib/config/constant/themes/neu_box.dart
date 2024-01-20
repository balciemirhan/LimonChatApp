import 'package:flutter/material.dart';
import 'package:limon_chat_app/config/constant/themes/color.dart';

class NeuBox extends StatelessWidget {
  const NeuBox({Key? key, required this.child, this.width, this.height})
      : super(key: key);

  final Widget child;
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    // Use provided width or default to 50
    return Container(
      width: width ?? 50,
      height: height ?? 50,
      child: Center(
        child: child,
      ),
      decoration: BoxDecoration(
        color: AppColor.neuBoxColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: AppColor.neuBoxShadowColorBR,
            blurRadius: 15,
            offset: Offset(5, 5),
          ),
          BoxShadow(
            color: AppColor.neuBoxShadowColorTL,
            blurRadius: 15,
            offset: Offset(-5, -5),
          ),
        ],
      ),
    );
  }
}

/* MediaQuery.of(context).size.width * .8 */