import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'dart:async';
import '../Config/app_config.dart';
import 'Languages/arabic.dart';
import 'Languages/english.dart';
import 'Languages/french.dart';
import 'Languages/german.dart';
import 'Languages/indonesian.dart';
import 'Languages/italian.dart';
import 'Languages/portuguese.dart';
import 'Languages/romanian.dart';
import 'Languages/spanish.dart';
import 'Languages/swahili.dart';
import 'Languages/turkish.dart';

class AppLocalizations {
  final Locale locale;
  AppLocalizations(this.locale);

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en': english(),
    'ar': arabic(),
    'pt': portuguese(),
    'fr': french(),
    'id': indonesian(),
    'es': spanish(),
    'it': italian(),
    'tr': turkish(),
    'sw': swahili(),
    "de": german(),
    "ro": romanian(),
  };

  String? get foodInsight {
    return _localizedValues[locale.languageCode]!['foodInsight'];
  }

  String? get table {
    return _localizedValues[locale.languageCode]!['table'];
  }

  String? get today {
    return _localizedValues[locale.languageCode]!['today'];
  }

  String? get week {
    return _localizedValues[locale.languageCode]!['week'];
  }

  String? get month {
    return _localizedValues[locale.languageCode]!['month'];
  }

  String? get backToOrder {
    return _localizedValues[locale.languageCode]!['backToOrder'];
  }

  String? get jan {
    return _localizedValues[locale.languageCode]!['jan'];
  }

  String? get totalItems {
    return _localizedValues[locale.languageCode]!['totalItems'];
  }

  String? get totalOrders {
    return _localizedValues[locale.languageCode]!['totalOrders'];
  }

  String? get timeCooked {
    return _localizedValues[locale.languageCode]!['timeCooked'];
  }

  String? get mostPopularItems {
    return _localizedValues[locale.languageCode]!['mostPopularItems'];
  }

  String? get kitchen {
    return _localizedValues[locale.languageCode]!['kitchen'];
  }

  String? get pastOrders {
    return _localizedValues[locale.languageCode]!['pastOrders'];
  }

  String? get noDataToShow {
    return _localizedValues[locale.languageCode]!['noDataToShow'];
  }

  String? get enterMobileNumber {
    return _localizedValues[locale.languageCode]!['enterMobileNumber'];
  }

  String? get continuee {
    return _localizedValues[locale.languageCode]!['continuee'];
  }

  String? get close {
    return _localizedValues[locale.languageCode]!['close'];
  }

  static List<Locale> getSupportedLocales() {
    List<Locale> toReturn = [];
    for (String langCode in AppConfig.languagesSupported.keys) {
      toReturn.add(Locale(langCode));
    }
    return toReturn;
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      AppConfig.languagesSupported.keys.contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(AppLocalizations(locale));
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
