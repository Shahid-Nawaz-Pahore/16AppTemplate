import 'package:hungerz/Locale/arabic.dart';
import 'package:hungerz/Locale/english.dart';
import 'package:hungerz/Locale/french.dart';
import 'package:hungerz/Locale/german.dart';
import 'package:hungerz/Locale/indonesian.dart';
import 'package:hungerz/Locale/italian.dart';
import 'package:hungerz/Locale/portuguese.dart';
import 'package:hungerz/Locale/romanian.dart';
import 'package:hungerz/Locale/spanish.dart';
import 'package:hungerz/Locale/swahili.dart';
import 'package:hungerz/Locale/turkish.dart';

class AppConfig {
  static final String appName = "Hungerz";
  static final bool isDemoMode = false;
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
