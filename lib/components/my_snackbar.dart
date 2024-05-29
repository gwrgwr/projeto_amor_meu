import 'package:flutter/material.dart';

class MySnackBar {
  SnackBar mySnackBar(final String text, BuildContext context) {
    return SnackBar(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      content: Text(
        text,
        style: TextStyle(color: Theme.of(context).colorScheme.background),
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
