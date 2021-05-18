import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pcms/utils/lang/en_arabic.dart';
import 'package:pcms/utils/lang/en_us.dart';

class LocalizationService extends Translations {
  static final LocalizationService _singleton = LocalizationService._internal();
  LocalizationService._internal();

  factory LocalizationService() {
    return _singleton;
  }
  // Default locale
  //static final locale = Locale('en', 'US');
  static var locale = Locale('en', 'US');
  static String currentLanguage = 'English';

  // fallbackLocale saves the day when the locale gets in trouble
  static final fallbackLocale = Locale('en', 'US');

  // Supported languages
  // Needs to be same order with locales
  static final langs = [
    'English',
    'Arabic',
  ];

  // Supported locales
  // Needs to be same order with langs
  static final locales = [
    Locale('en', 'US'),
    Locale('ar', 'AR'),
  ];

  // Keys and their translations
  // Translations are separated maps in `lang` file
  @override
  Map<String, Map<String, String>> get keys => {
        'en': enUS, // lang/en_us.dart
        'ar': enAR, // lang/en_arabic.dart
      };

  // Gets locale from language, and updates the locale
  void changeLocale(String lang) {
    final locale = getLocaleFromLanguage(lang);
    Get.updateLocale(locale);
  }

  // Finds language in `langs` list and returns it as Locale
  Locale getLocaleFromLanguage(String lang) {
    for (int i = 0; i < langs.length; i++) {
      if (lang == langs[i]) return locales[i];
    }
    return Get.locale;
  }

  static final codeToLang = {
    'en': 'English',
    // 'tr': 'Türkçe',
    // 'pt': 'Português',
    // 'es': 'Español',
    // 'fr': 'français'
    'ar': 'Arabic'
  };
}
