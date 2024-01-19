import 'package:flutter/material.dart';


InputDecoration customInputStyle(context, hint) {
  return InputDecoration(
    hintText: hint,
    prefixIcon: hint.contains('(__) ___ - __ - __')
        ? const Text('+998  ')
        : const Text('  '),
    prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
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
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black,
      ),
      borderRadius:  BorderRadius.all(
        Radius.circular(6),
      ),
    ),
  );
}
