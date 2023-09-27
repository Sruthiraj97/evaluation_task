import 'package:flutter/material.dart';
import 'package:indian_rupee_formatter_app/screens/withdrawalscreen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WithdrawalScreen(),
    );
  }
}
