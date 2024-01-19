import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:frontend/utils/styles.dart';
import 'package:frontend/utils/urls.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  @override
  State<SignUpScreen> createState() {
    return _SignUpScreenState();
  }
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  String _firstName = '';
  String _lastName = '';
  String _phoneNumber = '';
  String _password = '';
  bool _isLoading = false;

  void _save() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        _isLoading = true;
      });
      final api = Uri.parse(registerApi);
      final response = await http.post(
        api,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
        body: json.encode({
          'firstname': _firstName,
          'lastname': _lastName,
          'phone': '+998$_phoneNumber',
          'password': _password
        }),
      );

      if (response.statusCode == 201 && context.mounted) {
        setState(() {
          _isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)!.registered),
          ),
        );
      } else {
        print(response.body);
      }
    }
  }

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
              Text(AppLocalizations.of(context)!.signUp),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppLocalizations.of(context)!.firstName),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return AppLocalizations.of(context)!.requiredField;
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _firstName = value!;
                      },
                      decoration: customInputStyle(
                          context, AppLocalizations.of(context)!.enterName),
                    ),
                    const SizedBox(height: 20),
                    Text(AppLocalizations.of(context)!.lastName),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return AppLocalizations.of(context)!.requiredField;
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _lastName = value!;
                      },
                      decoration: customInputStyle(
                          context, AppLocalizations.of(context)!.enterSurname),
                    ),
                    const SizedBox(height: 20),
                    Text(AppLocalizations.of(context)!.phone),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return AppLocalizations.of(context)!.requiredField;
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _phoneNumber = value!;
                      },
                      decoration:
                          customInputStyle(context, '(__) ___ - __ - __'),
                    ),
                    const SizedBox(height: 20),
                    Text(AppLocalizations.of(context)!.password),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Required fields';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        _password = value;
                      },
                      obscureText: true,
                      decoration: customInputStyle(
                          context, AppLocalizations.of(context)!.enterPassword),
                    ),
                    const SizedBox(height: 20),
                    Text(AppLocalizations.of(context)!.confirm),
                    TextFormField(
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value != _password) {
                          return AppLocalizations.of(context)!.passwordError;
                        }
                        return null;
                      },
                      obscureText: true,
                      decoration: customInputStyle(
                        context,
                        AppLocalizations.of(context)!.confirmPassword,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: _save,
                child: Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        const Color(0xFF01001F).withOpacity(0.68),
                        const Color(0xFF01001F).withOpacity(1)
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Center(
                    child: _isLoading
                        ? const CircularProgressIndicator.adaptive(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.white,
                            ),
                            backgroundColor: Colors.white,
                          )
                        : Text(
                            AppLocalizations.of(context)!.save,
                            style: const TextStyle(
                              fontFamily: 'Mulish',
                              fontSize: 14,
                              color: Colors.white,
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
