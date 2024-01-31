import 'package:flutter/services.dart';

class CreditCardNumberFormatter extends TextInputFormatter {
  final int maxLength;

  CreditCardNumberFormatter({this.maxLength = 19});

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final newText = StringBuffer();
    int count = 0;
    for (int i = 0; i < newValue.text.length; i++) {
      if (count >= maxLength) break;
      if (newValue.text[i] != ' ') {
        if (count != 0 && count % 4 == 0) {
          newText.write(' ');
        }
        newText.write(newValue.text[i]);
        count++;
      }
    }
    return TextEditingValue(
      text: newText.toString(),
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}

class CreditCardExpirationFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final newText = StringBuffer();
    final String text = newValue.text.replaceAll('/', ''); // Remove any existing slashes
    for (int i = 0; i < text.length; i++) {
      newText.write(text[i]);
      if (i == 1 && i < 3 && text.length > 2 && !newValue.text.endsWith('/')) {
        newText.write('/'); // Add slash after month if not already there
      }
    }
    final formattedText = newText.toString();
    if (formattedText.length >= 2) {
      final month = int.tryParse(formattedText.substring(0, 2));
      if (month == null || month < 1 || month > 12) {
        return oldValue; // Reject the change if month is invalid
      }
    }
    if (formattedText.length >= 5) {
      final year = int.tryParse(formattedText.substring(3));
      final currentYear = DateTime.now().year % 100;
      if (year == null || year < currentYear) {
        return oldValue; // Reject the change if year is invalid
      }
    }
    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}
