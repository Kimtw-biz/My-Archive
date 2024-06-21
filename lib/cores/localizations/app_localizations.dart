import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizations {
  AppLocalizations();

  // dynamic operator [](Object? key) => _sentences[key];
  dynamic operator [](Object? key) {
    return _sentences[key];
  }

  late final Map<String, dynamic> _sentences;

  static const AppLocalizationsDelegate delegate = AppLocalizationsDelegate();

  static const List<Locale> supportedLocales = [Locale("ko")];
  static const List<String> supportedLanguages = ["ko"];

  static AppLocalizations of(BuildContext context) {
    try {
      return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
    } catch (e) {
      throw Error();
    }
  }

  String format(String key, [Map<String, dynamic>? params]) {
    final String value = this[key];

    String formatted = value;

    if (params != null && params.isNotEmpty) {
      params.forEach((key, value) {
        formatted = formatted.replaceAll("@{$key}", value.toString());
      });
    }

    return formatted;
  }

  String getLanguageLanguagePath(String languageCode) => "assets/langs/$languageCode.json";

  Future<AppLocalizations> _load(Locale locale) async {
    return await rootBundle.loadString(getLanguageLanguagePath(locale.languageCode)).then((data) {
      try {
        _sentences = jsonDecode(data);
      } catch (e) {
        debugPrint(e.toString());
      }

      return this;
    });
  }
}

@protected
class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => AppLocalizations.supportedLanguages.contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) async => await AppLocalizations()._load(locale);

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) => false;
}
