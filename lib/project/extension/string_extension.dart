import 'package:food_delivery_flutter/project/constant/string_constant.dart';

extension EmailValidator on String? {
  String? isEmailValid() {
    if (this == null || this?.isEmpty == true) return StringConstant.emailValidError;

    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';

    final regex = RegExp(pattern);

    return !regex.hasMatch(this!) ? StringConstant.emailValidError : null;
  }
}

extension CreditCardValidator on String? {
  String? isCreditCardNumberValid() {
    if (this == null || this?.isEmpty == true) {
      return 'Please enter a credit card number';
    }

    final value = this!;

    final cleanValue = value.replaceAll(RegExp(r'\s+|-'), '');

    if (cleanValue.length < 13 || cleanValue.length > 19) {
      return 'Credit card number must be between 13 and 19 digits';
    }

    if (!RegExp(r'^[0-9]+$').hasMatch(cleanValue)) {
      return 'Credit card number can only contain digits';
    }

    // Use Luhn algorithm to validate the credit card number
    var sum = 0;
    var shouldDouble = false;
    for (var i = cleanValue.length - 1; i >= 0; i--) {
      var digit = int.parse(cleanValue.substring(i, i + 1));
      if (shouldDouble) {
        digit *= 2;
        if (digit > 9) {
          digit -= 9;
        }
      }
      sum += digit;
      shouldDouble = !shouldDouble;
    }
    if (sum % 10 != 0) {
      return 'Invalid credit card number';
    }

    return null;
  }
}
