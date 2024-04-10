import 'package:flutter/material.dart';

extension ScrollNotificationExtensions on ScrollEndNotification {
  bool get hasReachedEnd => metrics.pixels == metrics.maxScrollExtent;
}
