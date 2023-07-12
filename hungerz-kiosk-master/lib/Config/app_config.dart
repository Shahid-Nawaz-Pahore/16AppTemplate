
import 'package:hungerz_kiosk/Locale/Languages/arabic.dart';
import 'package:hungerz_kiosk/Locale/Languages/english.dart';
import 'package:hungerz_kiosk/Locale/Languages/french.dart';
import 'package:hungerz_kiosk/Locale/Languages/german.dart';
import 'package:hungerz_kiosk/Locale/Languages/indonesian.dart';
import 'package:hungerz_kiosk/Locale/Languages/italian.dart';
import 'package:hungerz_kiosk/Locale/Languages/portuguese.dart';
import 'package:hungerz_kiosk/Locale/Languages/romanian.dart';
import 'package:hungerz_kiosk/Locale/Languages/spanish.dart';
import 'package:hungerz_kiosk/Locale/Languages/swahili.dart';
import 'package:hungerz_kiosk/Locale/Languages/turkish.dart';

class AppConfig {
  static final String appName = "Hungerz Kiosk";
  static final bool isDemoMode = true;
  static const String languageDefault = "en";
  static final Map<String, AppLanguage> languagesSupported = {
    "en": AppLanguage("English", english()),
    "ar": AppLanguage("عربى", arabic()),
    "pt": AppLanguage("Portugal", portuguese()),
    "fr": AppLanguage("Français", french()),
    "id": AppLanguage("Bahasa Indonesia", indonesian()),
    "es": AppLanguage("Español", spanish()),
    "it": AppLanguage("italiano", italian()),
    "tr": AppLanguage("Türk", turkish()),
    "sw": AppLanguage("Kiswahili", swahili()),
    "de": AppLanguage("Deutsch", german()),
    "ro": AppLanguage("Română", romanian()),
  };
}

class AppLanguage {
  final String name;
  final Map<String, String> values;
  AppLanguage(this.name, this.values);
}
