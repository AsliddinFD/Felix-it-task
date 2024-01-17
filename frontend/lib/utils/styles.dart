import 'package:flutter/material.dart';

const customTextStyle = TextStyle(
  fontFamily: 'Mulish',
  fontSize: 14,
  color: Color(0xFF232638),
);

const inputLabels = [
  {'label': 'First name', 'hint': '  Enter your first name'},
  {'label': 'Last name', 'hint': '  Enter your last name'},
  {'label': 'Phone number', 'hint': '  (__) ___ - __ - __'},
  {'label': 'Password', 'hint': '  Enter your password'},
  {'label': 'Confirm password', 'hint': '  Confirm your password'},
];

InputDecoration customInputStyle(context, hint) {
  return InputDecoration(
    hintText: hint,
    hintStyle: const TextStyle(
      color: Color(0xFFE7ECF3),
    ),
    contentPadding: const EdgeInsets.all(12),
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(6)),
    ),
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        color: Color(0xFFE7ECF3),
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(6),
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: MediaQuery.of(context).platformBrightness == Brightness.dark
            ? Colors.black
            : Colors.white,
      ),
      borderRadius: const BorderRadius.all(
        Radius.circular(6),
      ),
    ),
  );
}
