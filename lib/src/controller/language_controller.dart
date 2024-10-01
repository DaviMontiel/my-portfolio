import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:david_portfolio_app/src/model/enums/preference_value.dart';
import 'package:david_portfolio_app/src/model/preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations_en.dart';
import 'package:flutter_gen/gen_l10n/app_localizations_es.dart';

class LanguageController with ChangeNotifier {

  final String _defaultLocaleCode = 'en';
  final Map<String, Map> _supportedLocalizations = {
    'es': {
      'localization': AppLocalizationsEs(),
     },
    'en': {
      'localization': AppLocalizationsEn(),
     },
  };

  late AppLocalizations _language;
  late Locale _locale;

  Locale get locale => _locale;
  AppLocalizations get language => _language;


  Future init() async {
    // GET SAVED LANG
    Locale locale = await _getSystemLocale();

    // GET LOCALIZATION
    AppLocalizations? localization = _supportedLocalizations[locale.languageCode]?['localization'];

    if (localization == null) {
      localization = _supportedLocalizations[_defaultLocaleCode]!['localization'];
      locale = Locale(_defaultLocaleCode);
    }//IF
    
    _language = localization!;
    _locale = locale;

    notifyListeners();
  }

  Future changeLanguage(String code) async {
    if ( _locale.languageCode == code ) return;

    // CHANGE LANGUAGE IN PHONE
    await preferences.set(PreferenceValue.lang, code);

    // UPDATE DATA
    init();
  }

  AppLocalizations? getLanguageRaw() {
    return _language;
  }

  Future<AppLocalizations> getBackgroundLang() async {
    await init();
    var lang = getLanguageRaw();

    return lang!;
  }
  
  List<Locale> getSupportedLocales() {
    return _supportedLocalizations.keys.map((key) => Locale(key)).toList();
  }

  Future<Locale> _getSystemLocale() async {
    String? lang = await preferences.get(PreferenceValue.lang);
  
    if (lang == null) {
      // GET PHONE LANG
      Locale sysLocale = ui.window.locale;
      preferences.set(PreferenceValue.lang, sysLocale.languageCode);

      return sysLocale;
    }

    return Locale(lang);
  }
}

final languageController = LanguageController();