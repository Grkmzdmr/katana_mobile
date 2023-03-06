import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

Flushbar<dynamic> showFlushbar(String title, String message) {
  return Flushbar(
    borderRadius: BorderRadius.circular(12),
    padding: const EdgeInsets.all(24),
    margin: const EdgeInsets.all(12),
    flushbarPosition: FlushbarPosition.TOP,
    title: title,
    message: message,
    duration: const Duration(seconds: 3),
  );
}
