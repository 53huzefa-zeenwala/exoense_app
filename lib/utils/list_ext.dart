import 'package:flutter/material.dart';

extension ExtendField on List<Widget> {
  List<Widget> extend(Iterable<Widget> newWidgets) {
    for (var widget in newWidgets) {
      add(widget);
    }
    return this;
  }
}

extension CombineNonNull on List<String?> {
  String? combineNonNulls(String separator) {
    String? buffer;
    if (isEmpty) return null;
    if (length == 1) {
      return first;
    } else {
      buffer = first != null && first!.isNotEmpty ? first : '';
    }
    for (var i = 1; i < length; i++) {
      if (this[i] != null && this[i]!.isNotEmpty) {
        if (buffer != null && buffer!.isNotEmpty) {
          buffer = buffer + ', ';
        }
        buffer = buffer! + this[i]!;
      }
    }
    return buffer?.toString();
  }
}
