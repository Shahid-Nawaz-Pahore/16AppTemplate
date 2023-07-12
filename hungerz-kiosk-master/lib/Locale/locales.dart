import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'package:hungerz_kiosk/Config/app_config.dart';
import 'package:hungerz_kiosk/Locale/Languages/german.dart';
import 'package:hungerz_kiosk/Locale/Languages/romanian.dart';
import 'dart:async';
import 'Languages/arabic.dart';
import 'Languages/english.dart';
import 'Languages/french.dart';
import 'Languages/indonesian.dart';
import 'Languages/italian.dart';
import 'Languages/portuguese.dart';
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

  String? get fastFood {
    return _localizedValues[locale.languageCode]!['fastFood'];
  }

  String? get seaFood {
    return _localizedValues[locale.languageCode]!['seaFood'];
  }

  String? get chinesee {
    return _localizedValues[locale.languageCode]!['chinesee'];
  }

  String? get dessert {
    return _localizedValues[locale.languageCode]!['dessert'];
  }

  String? get tableNo {
    return _localizedValues[locale.languageCode]!['tableNo'];
  }

  String? get totalAmount {
    return _localizedValues[locale.languageCode]!['totalAmount'];
  }

  String? get finishOrdering {
    return _localizedValues[locale.languageCode]!['finishOrdering'];
  }

  String? get searchItem {
    return _localizedValues[locale.languageCode]!['searchItem'];
  }

  String? get itemsInCart {
    return _localizedValues[locale.languageCode]!['itemsInCart'];
  }

  String? get weMustSay {
    return _localizedValues[locale.languageCode]!['weMustSay'];
  }

  String? get youveGreat {
    return _localizedValues[locale.languageCode]!['youveGreat'];
  }

  String? get youveGreatchoiceoOfTaste {
    return _localizedValues[locale.languageCode]!['youveGreatchoiceoOfTaste'];
  }

  String? get choiceoOfTaste {
    return _localizedValues[locale.languageCode]!['choiceoOfTaste'];
  }

  String? get orderConfirmedWith {
    return _localizedValues[locale.languageCode]!['orderConfirmedWith'];
  }

  String? get yourOrderWillBeAtYourTable {
    return _localizedValues[locale.languageCode]!['yourOrderWillBeAtYourTable'];
  }

  String? get description {
    return _localizedValues[locale.languageCode]!['description'];
  }

  String? get knowHowWeCookIt {
    return _localizedValues[locale.languageCode]!['knowHowWeCookIt'];
  }

  String? get minVideo {
    return _localizedValues[locale.languageCode]!['minVideo'];
  }

  String? get servings {
    return _localizedValues[locale.languageCode]!['servings'];
  }

  String? get cookTime {
    return _localizedValues[locale.languageCode]!['cookTime'];
  }

  String? get people {
    return _localizedValues[locale.languageCode]!['people'];
  }

  String? get mins {
    return _localizedValues[locale.languageCode]!['mins'];
  }

  String? get energy {
    return _localizedValues[locale.languageCode]!['energy'];
  }

  String? get cal {
    return _localizedValues[locale.languageCode]!['cal'];
  }

  String? get ingredients {
    return _localizedValues[locale.languageCode]!['ingredients'];
  }

  String? get foodItems {
    return _localizedValues[locale.languageCode]!['foodItems'];
  }

  String? get addOptions {
    return _localizedValues[locale.languageCode]!['addOptions'];
  }

  String? get addToCart {
    return _localizedValues[locale.languageCode]!['addToCart'];
  }

  String? get relatedItemsYouMayLike {
    return _localizedValues[locale.languageCode]!['relatedItemsYouMayLike'];
  }

  String? get ordered {
    return _localizedValues[locale.languageCode]!['ordered'];
  }

  String? get items {
    return _localizedValues[locale.languageCode]!['items'];
  }

  String? get table {
    return _localizedValues[locale.languageCode]!['table'];
  }

  String? get noOrder {
    return _localizedValues[locale.languageCode]!['noOrder'];
  }

  String? get touchToExplore {
    return _localizedValues[locale.languageCode]!['touchToExplore'];
  }

  String? get welcome {
    return _localizedValues[locale.languageCode]!['welcome'];
  }

  String? get scrollchoose {
    return _localizedValues[locale.languageCode]!['scrollchoose'];
  }

  String? get cancelOrder {
    return _localizedValues[locale.languageCode]!['cancelOrder'];
  }

  String? get reviewOrder {
    return _localizedValues[locale.languageCode]!['reviewOrder'];
  }

  String? get placeOrder {
    return _localizedValues[locale.languageCode]!['placeOrder'];
  }

  String? get yourOrderNumberIs {
    return _localizedValues[locale.languageCode]!['yourOrderNumberIs'];
  }

  String? get payAtCounterWhen {
    return _localizedValues[locale.languageCode]!['payAtCounterWhen'];
  }

  String? get yourOrderWillBeReady {
    return _localizedValues[locale.languageCode]!['yourOrderWillBeReady'];
  }

  String? get continueText {
    return _localizedValues[locale.languageCode]!['continueText'];
  }

  String? get sentOnNumber {
    return _localizedValues[locale.languageCode]!['sentOnNumber'];
  }

  String? get enterVerificationCode {
    return _localizedValues[locale.languageCode]!['enterVerificationCode'];
  }

  String? get enterRegistered {
    return _localizedValues[locale.languageCode]!['enterRegistered'];
  }

  String? get phoneNumberToStart {
    return _localizedValues[locale.languageCode]!['phoneNumberToStart'];
  }

  String? get phoneNumber {
    return _localizedValues[locale.languageCode]!['phoneNumber'];
  }

  String? get wellSendCode {
    return _localizedValues[locale.languageCode]!['wellSendCode'];
  }

  String? get submit {
    return _localizedValues[locale.languageCode]!['submit'];
  }

  String? get myOrder {
    return _localizedValues[locale.languageCode]!['myOrder'];
  }

  String? get quickCheckout {
    return _localizedValues[locale.languageCode]!['quickCheckout'];
  }

  String? get chooseOrderingMethod {
    return _localizedValues[locale.languageCode]!['chooseOrderingMethod'];
  }

  String? get takeAway {
    return _localizedValues[locale.languageCode]!['takeAway'];
  }

  String? get dineIn {
    return _localizedValues[locale.languageCode]!['dineIn'];
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
