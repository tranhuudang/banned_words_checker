import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:i18n_extension/i18n_extension.dart';

extension StringExtenstion on String {
  Locale toLocale() {
    switch (this) {
      case "en":
        return const Locale('en', "US");
      case "vi":
        return const Locale('vi', "VI");
      default:
        return WidgetsBinding.instance.platformDispatcher.locale;
    }
  }
}

extension Localization on Object {
  static final _t = Translations.byId<Object>("en_us", {
    /// Common
    // NoInternetBubble
    "Home": {
      "en_us": "Home",
      "vi_vi": "Trang chủ",
    },
    "Products": {
      "en_us": "Products",
      "vi_vi": "Sản phẩm",
    },
    "Privacy policy": {
      "en_us": "Privacy policy",
      "vi_vi": "Chính sách riêng tư",
    },
    "About": {
      "en_us": "About",
      "vi_vi": "Thông tin",
    },
    // "": {
    //   "en_us": "",
    //   "vi_vi": "",
    // },
  });

  String get i18n => localize(this, _t);
  String get i18nEnglish => localize(this, _t, locale: 'en_us');

  String fill(List<Object> params) => localizeFill(this, params);

  String plural(value) => localizePlural(value, this, _t);
}
