import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:frontend/utils/styles.dart';
import 'package:frontend/widgets/dropdown_widget.dart';

class LanguageSelection extends StatefulWidget {
  const LanguageSelection({super.key});
  @override
  State<LanguageSelection> createState() {
    return _LanguageSelectionState();
  }
}

class _LanguageSelectionState extends State<LanguageSelection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Center(
                  child: SvgPicture.asset('assets/Logo.svg'),
                ),
              ),
              const SizedBox(
                width: double.infinity,
                child: Text(
                  'Languages',
                  style: customTextStyle,
                  textAlign: TextAlign.left,
                ),
              ),
              const DropDown(),
              const SizedBox(height: 20),
              GestureDetector(
                child: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: const Color(0xFF01001F),
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(255, 201, 200, 226),
                        spreadRadius: 5,
                        blurRadius: 10,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
