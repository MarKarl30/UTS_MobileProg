import 'dart:math';

import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import 'utils.dart';

class CurrencyInputFormatter extends TextInputFormatter {
  final int decimalPlaces;
  final bool allowNegative;

  final NumberFormat _formatter;

  CurrencyInputFormatter({
    this.decimalPlaces = 3,
    this.allowNegative = false,
  }) : _formatter = NumberFormat.currency(
          decimalDigits: decimalPlaces,
          locale: 'pt_BR',
          symbol: 'Rp',
        );

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return textManipulation(
      oldValue,
      newValue,
      textInputFormatter: allowNegative
          ? FilteringTextInputFormatter.allow(RegExp('[0-9-]+'))
          : FilteringTextInputFormatter.digitsOnly,
      formatPattern: (String filteredString) {
        if (allowNegative) {
          if ('-'.allMatches(filteredString).length > 1) {
            print(filteredString);
            filteredString = (filteredString.startsWith('-') ? '-' : '');
            filteredString.replaceAll('-', '');
          }
        }

        if (filteredString.isEmpty) return '';
        num number;
        number = int.tryParse(filteredString) ?? 0;
        if (decimalPlaces > 0) {
          number /= pow(10, decimalPlaces);
        }

        final result = _formatter.format(number);

        if (allowNegative) {
          if (filteredString == '-' ||
              RegExp(r'-0?0+$').hasMatch(filteredString)) {
            return '-';
          }
        }

        return result;
      },
    );
  }
}
