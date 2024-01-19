import 'package:flutter/material.dart';
import 'package:frontend/screens/club_ads_add.dart';
import 'package:frontend/screens/sign_up_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:frontend/screens/languge_selection_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});
  @override
  State<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreen> {
  int currentIndex = 0;
  selectScreen(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activeScreen = const LanguageSelection();
    if (currentIndex == 1) {
      activeScreen = const SignUpScreen();
    } else if (currentIndex == 2) {
      activeScreen = const ClubAdsAdd();
    }
    return Scaffold(
      body: activeScreen,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: selectScreen,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.language),
            label: AppLocalizations.of(context)!.chooseLanguage,
          ),
          BottomNavigationBarItem(
              icon: const Icon(Icons.app_registration),
              label: AppLocalizations.of(context)!.signUp),
          BottomNavigationBarItem(
              icon: const Icon(Icons.add),
              label: AppLocalizations.of(context)!.clubAds),
        ],
      ),
    );
  }
}
