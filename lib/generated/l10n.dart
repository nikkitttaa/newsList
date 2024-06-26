// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class AppLocalization {
  AppLocalization();

  static AppLocalization? _current;

  static AppLocalization get current {
    assert(_current != null,
        'No instance of AppLocalization was loaded. Try to initialize the AppLocalization delegate before accessing AppLocalization.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<AppLocalization> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = AppLocalization();
      AppLocalization._current = instance;

      return instance;
    });
  }

  static AppLocalization of(BuildContext context) {
    final instance = AppLocalization.maybeOf(context);
    assert(instance != null,
        'No instance of AppLocalization present in the widget tree. Did you add AppLocalization.delegate in localizationsDelegates?');
    return instance!;
  }

  static AppLocalization? maybeOf(BuildContext context) {
    return Localizations.of<AppLocalization>(context, AppLocalization);
  }

  /// `Перейти в источник`
  String get goToSource {
    return Intl.message(
      'Перейти в источник',
      name: 'goToSource',
      desc: '',
      args: [],
    );
  }

  /// `Ошибка при загрузки данных`
  String get errorLoadingData {
    return Intl.message(
      'Ошибка при загрузки данных',
      name: 'errorLoadingData',
      desc: '',
      args: [],
    );
  }

  /// `Ошибка: ${snapshot.error}`
  String get errorSnapshot {
    return Intl.message(
      'Ошибка: \${snapshot.error}',
      name: 'errorSnapshot',
      desc: '',
      args: [],
    );
  }

  /// `Все новости`
  String get allNews {
    return Intl.message(
      'Все новости',
      name: 'allNews',
      desc: '',
      args: [],
    );
  }

  /// `Что-то пошло не так`
  String get errorFullNews {
    return Intl.message(
      'Что-то пошло не так',
      name: 'errorFullNews',
      desc: '',
      args: [],
    );
  }

  /// `Ожидание загрузки данных`
  String get waitingDataLoad {
    return Intl.message(
      'Ожидание загрузки данных',
      name: 'waitingDataLoad',
      desc: '',
      args: [],
    );
  }

  /// `Поиск..`
  String get search {
    return Intl.message(
      'Поиск..',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Вы не ввели запрос. Введите запрос.`
  String get searchErrorNull {
    return Intl.message(
      'Вы не ввели запрос. Введите запрос.',
      name: 'searchErrorNull',
      desc: '',
      args: [],
    );
  }

  /// `Не найдено`
  String get descriptionNotFound {
    return Intl.message(
      'Не найдено',
      name: 'descriptionNotFound',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'ru'),
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<AppLocalization> load(Locale locale) => AppLocalization.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
