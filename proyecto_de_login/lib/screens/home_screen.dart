// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:proyecto_de_login/widgets/widgets.dart';

// ignore: use_key_in_widget_constructors
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Productos'),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: ListView.builder(
          itemCount: 20,
          itemBuilder: (BuildContext context, index) => GestureDetector(
              onTap: () => Navigator.pushNamed(context, 'productScreen'),
              child: ProductCard())),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: Icon(
          Icons.add,
          color: Colors.purple[300],
        ),
        onPressed: () {},
      ),
    );
  }
}
