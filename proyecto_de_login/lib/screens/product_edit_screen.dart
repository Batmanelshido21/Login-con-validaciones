import 'package:flutter/material.dart';
import 'package:proyecto_de_login/widgets/widgets.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // ignore: prefer_const_constructors
        title: Text('pantalla de edición de producto'),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                // ignore: prefer_const_constructors
                ProductImage(),
                Positioned(
                    top: 30,
                    right: 30,
                    // ignore: prefer_const_constructors
                    child: IconButton(
                      icon: Icon(Icons.add_a_photo),
                      onPressed: () {},
                    ))
              ],
            ),
            // ignore: prefer_const_constructors
            _ProductForm(),
            SizedBox(
              height: 100,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.purple,
        child: Icon(Icons.save_outlined),
      ),
    );
  }
}

class _ProductForm extends StatelessWidget {
  const _ProductForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Container(
        width: double.infinity,
        height: 300,
        decoration: _buildBoxDecoration(),
        child: Form(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              _TextFieldNombre(),
              SizedBox(
                height: 10,
              ),
              _TextFieldPrecio(),
              SizedBox(
                height: 10,
              ),
              SwitchListTile(
                  activeColor: Colors.purple,
                  title: Text('Disponibilidad'),
                  value: true,
                  onChanged: (value) {
                    //Algo pendiente de hacer
                  }),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(30), bottomLeft: Radius.circular(30)));
}

class _TextFieldPrecio extends StatelessWidget {
  const _TextFieldPrecio({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: "Precio del producto",
        labelText: "Precio:",
      ),
      onChanged: (value) {},
    );
  }
}

class _TextFieldNombre extends StatelessWidget {
  const _TextFieldNombre({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: "Nombre del producto",
        labelText: "Nombre:",
      ),
      onChanged: (value) {},
    );
  }
}
