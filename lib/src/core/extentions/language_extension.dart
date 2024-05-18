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
    "Check if your paragraph contains any banned words from TikTok that could potentially reduce your viewership.":
        {
      "en_us":
          "Check if your paragraph contains any banned words from TikTok that could potentially reduce your viewership.",
      "vi_vi":
          "Kiểm tra xem đoạn văn của bạn có chứa từ bị cấm từ TikTok không, vì những từ này có thể làm giảm lượng người xem của bạn.",
    },
    "Total words in the banned list": {
      "en_us": "Total words in the banned list",
      "vi_vi": "Tổng số từ trong danh sách bị cấm",
    },
    "Privacy policy": {
      "en_us": "Privacy policy",
      "vi_vi": "Chính sách riêng tư",
    },
    "Enter the paragraph you want to check here": {
      "en_us": "Enter the paragraph you want to check here",
      "vi_vi": "Nhập đoạn văn bạn muốn kiểm tra tại đây",
    },
    "Check Words": {
      "en_us": "Check Words",
      "vi_vi": "Kiểm tra từ ngữ",
    },

    "Found words": {
      "en_us": "Found words",
      "vi_vi": "Từ được tìm thấy",
    },
    "Report word": {
      "en_us": "Report word",
      "vi_vi": "Báo cáo từ",
    },
    "Enter a new word to add": {
      "en_us": "Enter a new word to add",
      "vi_vi": "Nhập từ bạn muốn báo cáo",
    },
    "Help us improve the app by report new words": {
      "en_us": "Help us improve the app by report new words",
      "vi_vi": "Giúp chúng tôi cải thiện bằng cách báo cáo những từ mới",
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
