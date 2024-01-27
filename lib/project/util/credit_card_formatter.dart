import 'package:flutter/services.dart';

class CreditCardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final newText = StringBuffer();
    for (int i = 0; i < newValue.text.length; i++) {
      newText.write(newValue.text[i]);
      if ((i + 1) % 4 == 0 && i != newValue.text.length - 1) {
        newText.write(' ');
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
      if (i == 1 && i < 3) {
        newText.write('/'); // Add slash after month
      }
    }
    final formattedText = newText.toString();
    if (formattedText.length == 5) {
      // Check if the month is valid (between 1 and 12)
      final month = int.tryParse(formattedText.substring(0, 2));
      if (month == null || month < 1 || month > 12) {
        return oldValue; // Reject the change if month is invalid
      }

      final currentYear = DateTime.now().year % 100; // Get last two digits of current year
      final year = int.tryParse(formattedText.substring(3));
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
