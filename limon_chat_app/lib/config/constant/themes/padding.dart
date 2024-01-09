import 'package:flutter/material.dart';

final class AppPadding {
  const AppPadding._();

  static const EdgeInsets minimalPadding = EdgeInsets.only(top: 32);

  static Padding get largeVerticalPadding =>
      const Padding(padding: EdgeInsets.only(top: 32.0));

/* Widget build(BuildContext context) {
    bool isLargeScreen = MediaQuery.of(context).size.width > 600;
    return Scaffold(
      body: Padding(
        padding: isLargeScreen ? largeVerticalPadding : minimalPadding,
        child: Text('This text has different padding based on screen size.'),
      ),
    );
  }
 */
}
