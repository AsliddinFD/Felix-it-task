import 'package:flutter/material.dart';
import 'package:country_flags/country_flags.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/providers/language_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DropDown extends ConsumerStatefulWidget {
  const DropDown({super.key});
  @override
  ConsumerState<DropDown> createState() {
    return _DropDownState();
  }
}

class _DropDownState extends ConsumerState<DropDown> {
  final languages = [
    {'code': 'uz', 'language': 'O\'zbek'},
    {'code': 'ru', 'language': 'Русский'},
    {'code': 'uz', 'language': 'Ўзбек'},
  ];
  final languageToCountryCode = {
    'Ўзбек': 'uz',
    'O\'zbek': 'uz',
    'Русский': 'ru',
  };

  late String countryCode;

  @override
  void initState() {
    super.initState();
    countryCode = languageToCountryCode['O\'zbek'].toString();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFE7ECF3)),
        borderRadius: BorderRadius.circular(6),
      ),
      child: DropdownMenu(
        width: 388,
        leadingIcon: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: CountryFlag.fromCountryCode(
            countryCode,
            width: 24,
            height: 14,
          ),
        ),
        hintText: '  ${AppLocalizations.of(context)!.selectLanguage}',
        trailingIcon: const Icon(Icons.keyboard_arrow_down_outlined),
        selectedTrailingIcon: const Icon(Icons.keyboard_arrow_up_outlined),
        menuStyle: MenuStyle(
          side: MaterialStateProperty.all<BorderSide>(
            const BorderSide(color: Color(0xFFE7ECF3)),
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(borderSide: BorderSide.none),
        ),
        dropdownMenuEntries: languages
            .map(
              (item) => DropdownMenuEntry(
                value: item['language'],
                leadingIcon: CountryFlag.fromCountryCode(
                  item['code']!,
                  width: 24,
                  height: 24,
                ),
                label: '  ${item['language']!}',
              ),
            )
            .toList(),
        onSelected: (newVal) {
          setState(() {
            countryCode = languageToCountryCode[newVal]!;
          });
          if (newVal == 'Ўзбек') {
            ref.watch(languageProvide.notifier).toggleLanguage('Ўзбек');
          } else {
            ref.watch(languageProvide.notifier).toggleLanguage(
                  languageToCountryCode[newVal],
                );
          }
        },
      ),
    );
  }
}
