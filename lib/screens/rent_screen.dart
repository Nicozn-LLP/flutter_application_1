import 'package:flutter/material.dart';
import 'package:renttt/screens/select_category.dart';

class RentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SelectCategory(),
      ),
    );
  }
}
