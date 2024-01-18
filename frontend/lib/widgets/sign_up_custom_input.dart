import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  const CustomInput({
    super.key,
    required this.inputLabel,
    required this.hintText,
  });
  final String inputLabel;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          inputLabel,
          style: const TextStyle(
            color: Color(0xFF232638),
          ),
        ),
        const SizedBox(height: 5),
        TextFormField(
          obscureText:
              inputLabel == 'Password' || inputLabel == 'Confirm password'
                  ? true
                  : false,
          decoration: InputDecoration(
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
                color:
                    MediaQuery.of(context).platformBrightness == Brightness.dark
                        ? Colors.black
                        : Colors.white,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(6),
              ),
            ),
            isDense: true,
            hintText: hintText,
            hintStyle: const TextStyle(
              color: Color(0xFFE7ECF3),
            ),
            prefixIcon: inputLabel == 'Phone number'
                ? const Text('  +998 ')
                : const Text(''),
            prefixIconConstraints:
                const BoxConstraints(minWidth: 0, minHeight: 0),
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
