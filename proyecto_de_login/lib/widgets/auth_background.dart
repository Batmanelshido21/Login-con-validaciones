// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {
  final Widget child;

  const AuthBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple,
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [CajaPurpura(), _HeraderICon(), child],
      ),
    );
  }
}

class _HeraderICon extends StatelessWidget {
  const _HeraderICon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(top: 80),
        width: double.infinity,
        child: Icon(
          Icons.person_pin,
          color: Colors.blue,
          size: 100,
        ),
      ),
    );
  }
}

// ignore: use_key_in_widget_constructors
class CajaPurpura extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        width: double.infinity,
        height: size.height * .4,
        decoration: _purpleDecoration(),
        child: Stack(
          children: [
            Positioned(
              child: _Burble(),
              top: 90,
              left: 30,
            ),
            Positioned(
              child: _Burble(),
              top: -40,
              left: -30,
            ),
            Positioned(
              child: _Burble(),
              bottom: -50,
              right: -20,
            ),
            Positioned(
              child: _Burble(),
              bottom: -50,
              left: 10,
            ),
            Positioned(
              child: _Burble(),
              top: 120,
              right: 20,
            ),
          ],
        ));
  }

  BoxDecoration _purpleDecoration() => BoxDecoration(
          // ignore: prefer_const_literals_to_create_immutables
          gradient: LinearGradient(colors: [
        Color.fromRGBO(63, 63, 156, 1),
        Color.fromRGBO(90, 70, 178, 1)
      ]));
}

class _Burble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Color.fromRGBO(255, 255, 155, 0.05)));
  }
}
