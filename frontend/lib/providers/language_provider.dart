import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LanguageProviderNotifier extends StateNotifier<Locale> {
  LanguageProviderNotifier() : super(const Locale('en'));

  toggleLanguage(newLang) {
    if (newLang == 'Ўзбек') {
      state = const Locale.fromSubtags(languageCode: 'uz', scriptCode: 'Cyrl');
      return state;
    } else {
      state = Locale(newLang);
      return state;
    }
  }
}

final languageProvide =
    StateNotifierProvider<LanguageProviderNotifier, Locale>(
  (ref) => LanguageProviderNotifier(),
);
