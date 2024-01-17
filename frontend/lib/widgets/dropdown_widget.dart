import 'package:flutter/material.dart';
import 'package:country_flags/country_flags.dart';

class DropDown extends StatefulWidget {
  const DropDown({super.key});
  @override
  State<DropDown> createState() {
    return _DropDownState();
  }
}

class _DropDownState extends State<DropDown> {
  final languages = [
    {'code': 'UZ', 'language': 'O\'zbek'},
    {'code': 'RU', 'language': 'Русский'},
    {'code': 'GB', 'language': 'English'},
  ];
  final languageToCountryCode = {
    'English': 'GB',
    'O\'zbek': 'UZ',
    'Русский': 'RU',
  };

  late String countryCode;

  @override
  void initState() {
    super.initState();
    countryCode = languageToCountryCode['O\'zbek']!;
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
        hintText: '  Choose a language',
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
        },
      ),
    );
  }
}
