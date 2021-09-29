// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_de_login/screens/screens.dart';
import 'package:proyecto_de_login/services/services.dart';
import 'package:proyecto_de_login/widgets/widgets.dart';

// ignore: use_key_in_widget_constructors
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productService = Provider.of<ProductServices>(context);
    if (productService.isLoading) return LoadingScreen();
    return Scaffold(
      appBar: AppBar(
        title: Text('Productos'),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: ListView.builder(
          itemCount: productService.products.length,
          itemBuilder: (BuildContext context, index) => GestureDetector(
              onTap: () => Navigator.pushNamed(context, 'productScreen'),
              child: ProductCard(
                product: productService.products[index],
              ))),
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
