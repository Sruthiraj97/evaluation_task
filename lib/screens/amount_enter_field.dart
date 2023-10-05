import 'package:flutter/material.dart';
import 'package:indian_rupee_formatter_app/constants/textconstants.dart';

class AmountInputField extends StatefulWidget {
  final TextEditingController controller;

  const AmountInputField({super.key, required this.controller});

  @override
  State<AmountInputField> createState() => _AmountInputFieldState();
}

class _AmountInputFieldState extends State<AmountInputField> {
  FocusNode numberFocusNode = FocusNode();
  String lastInputValue = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1.0),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: customTextField(),
      ),
    );
  }

  InputDecoration _buildInputDecoration() {
    return InputDecoration(
      hintText: TextConstants.hintText,
      border: InputBorder.none,
      contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
    );
  }

  void _handleInputChange(String value) {
    value = value.replaceAll(RegExp(r'[^0-9.₹]'), '');

    String formattedValue = value;
    formattedValue = formattedValue.replaceAll(',', '');
    formattedValue = formattedValue.replaceAll('₹', '');

    if (formattedValue.isNotEmpty) {
      formattedValue = _formatIndianNumber(formattedValue);
    }

    if (formattedValue.isEmpty) {
      widget.controller.value = const TextEditingValue(
        text: '',
        selection: TextSelection.collapsed(offset: 0),
      );
    } else {
      widget.controller.value = TextEditingValue(
        text: '₹$formattedValue',
        selection: TextSelection.collapsed(offset: formattedValue.length + 1),
      );
    }
  }

  String _formatIndianNumber(String value) {
    if (value.isEmpty) {
      return '';
    }

    List<String> parts = value.split('.');
    String integerPart = parts[0].replaceAll(',', '');
    String decimalPart = parts.length > 1 ? '.${parts[1]}' : '';
    if (decimalPart.length > 3) {
      decimalPart = decimalPart.substring(0, 3);
    }

    String lastDigit = '';
    if (integerPart.isNotEmpty) {
      lastDigit = integerPart[integerPart.length - 1];
    }

    // String lastDigit = integerPart[integerPart.length - 1];
    String result = '';
    int len = integerPart.length - 1;
    int nDigits = 0;
    for (int i = len - 1; i >= 0; i--) {
      result = integerPart[i] + result;
      nDigits++;
      if ((nDigits % 2 == 0) && (i > 0)) {
        result = ',$result';
      }
    }

    return result + lastDigit + decimalPart;
  }

  Widget customTextField() {
    return TextField(
      // maxLength: 10,
      focusNode: numberFocusNode,
      textAlign: TextAlign.center,
      controller: widget.controller,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      decoration: _buildInputDecoration(),
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
      onSubmitted: (_) {
        FocusScope.of(context).unfocus();
      },
      onChanged: _handleInputChange,
    );
  }
}
