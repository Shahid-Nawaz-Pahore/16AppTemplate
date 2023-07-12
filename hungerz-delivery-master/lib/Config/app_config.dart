

import '../Locale/arabic.dart';
import '../Locale/english.dart';
import '../Locale/french.dart';
import '../Locale/german.dart';
import '../Locale/indonesian.dart';
import '../Locale/italian.dart';
import '../Locale/portuguese.dart';
import '../Locale/romanian.dart';
import '../Locale/spanish.dart';
import '../Locale/swahili.dart';
import '../Locale/turkish.dart';

class AppConfig {
  static final String appName = "Hungerz store";
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
