import 'package:flutter/material.dart';
import 'package:frontend/utils/styles.dart';
import 'package:frontend/widgets/sign_up_custom_input.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  @override
  State<SignUpScreen> createState() {
    return _SignUpScreenState();
  }
}

class _SignUpScreenState extends State<SignUpScreen> {
  //api berilgandan keyin qo'shiladi:

  // final _formKey = GlobalKey<FormState>();
  // String _firstName = '';
  // String _lastName = '';
  // String _phoneNumber = '';
  // String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 25),
              Image.asset('assets/sign-up-image.png'),
              const Text('Sign Up'),
              Form(
                child: Column(
                  children: [
                    for (var i in inputLabels)
                      CustomInput(
                        inputLabel: i['label']!,
                        hintText: i['hint']!,
                      ),
                  ],
                ),
              ),
              GestureDetector(
                child: Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      const Color(0xFF01001F).withOpacity(0.68),
                      const Color(0xFF01001F).withOpacity(1)
                    ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Center(
                    child: Text(
                      'Save',
                      style: TextStyle(
                        fontFamily: 'Mulish',
                        fontSize: 14,
                        color: MediaQuery.of(context).platformBrightness ==
                                Brightness.dark
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
