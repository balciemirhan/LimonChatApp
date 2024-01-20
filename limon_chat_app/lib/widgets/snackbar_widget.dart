import 'package:flutter/material.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> snackBarWidget(
    context, String message,
    {Color? color}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: color ?? Colors.red,
      content: Text(message),
      action: SnackBarAction(
        label: "Kapat",
        onPressed: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
      ),
    ),
  );
}
