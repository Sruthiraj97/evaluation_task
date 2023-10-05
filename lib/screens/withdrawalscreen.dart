import 'package:flutter/material.dart';
import 'package:indian_rupee_formatter_app/constants/textconstants.dart';
import 'package:indian_rupee_formatter_app/screens/amount_enter_field.dart';

class WithdrawalScreen extends StatefulWidget {
  const WithdrawalScreen({Key? key}) : super(key: key);

  @override
  State<WithdrawalScreen> createState() => _WithdrawalScreenState();
}

class _WithdrawalScreenState extends State<WithdrawalScreen> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      body: Padding(
        padding: commonEdgeInsets,
        child: SizedBox(
          height: 200.0,
          child: Card(
            margin: commonEdgeInsets,
            child: Padding(
              padding: commonEdgeInsets,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customText(TextConstants.enterAmount, Colors.black),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.0),
                  ),
                  AmountInputField(controller: _textEditingController),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

PreferredSizeWidget customAppBar() {
  return AppBar(
    backgroundColor: Colors.purple,
    title: customText(TextConstants.indianRupeeExample, Colors.white),
    leading: const Padding(
      padding: EdgeInsets.only(
        left: 10,
      ),
      child: Icon(
        Icons.arrow_back_ios,
      ),
    ),
  );
}

SizedBox customSizedBox(double height) {
  return SizedBox(height: height);
}

TextStyle customTextStyle({Color? color}) {
  return TextStyle(
    color: color ?? Colors.white, // Use the provided color or default to white
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
  );
}

Text customText(String text, Color color) {
  return Text(
    text,
    style: customTextStyle(color: color),
  );
}

const EdgeInsets commonEdgeInsets = EdgeInsets.all(16.0);
