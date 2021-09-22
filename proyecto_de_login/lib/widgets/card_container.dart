// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class CardContainer extends StatelessWidget {
  final Widget child;

  const CardContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      // ignore: prefer_const_constructors
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        decoration: _createCard(),
        child: this.child,
      ),
    );
  }

  // ignore: prefer_const_constructors
  BoxDecoration _createCard() => BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
          // ignore: prefer_const_literals_to_create_immutables
          boxShadow: [
            BoxShadow(
                color: Colors.black, blurRadius: 15, offset: Offset(0, 10))
          ]);
}
