import 'package:flutter/material.dart';
import 'package:proyecto_de_login/models/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({Key? key, required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          margin: EdgeInsets.only(top: 30, bottom: 50),
          width: double.infinity,
          height: 400,
          decoration: _cardBorders(),
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              _BackGroundImage(
                product: product,
              ),
              _ProductDetails(
                product: product,
              ),
              Positioned(
                child: _PriceTag(
                  product: product,
                ),
                top: 0,
                right: 0,
              ),
              Positioned(
                child: _NotAvailable(
                  product: product,
                ),
                top: 0,
                left: 0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _cardBorders() => BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
                color: Colors.purple, offset: Offset(0, 7), blurRadius: 10)
          ]);
}

class _BackGroundImage extends StatelessWidget {
  final Product product;

  const _BackGroundImage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Container(
        width: double.infinity,
        height: 400,
        child: FadeInImage(
          placeholder: AssetImage('lib/assets/jar-loading.gif'),
          image: NetworkImage(product.picture.toString()),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _ProductDetails extends StatelessWidget {
  final Product product;

  const _ProductDetails({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Container(
          padding: EdgeInsets.symmetric(vertical: 20),
          width: double.infinity,
          height: 81,
          color: Colors.blue,
          child: Column(
            children: [
              Text(
                product.name,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                product.id.toString(),
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              )
            ],
          )),
    );
  }
}

class _PriceTag extends StatelessWidget {
  final Product product;

  const _PriceTag({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: FittedBox(
        fit: BoxFit.contain,
        child: Text(
          '\$ ' + product.price.toString(),
          style: TextStyle(fontSize: 20, color: Colors.black),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ),
      decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), bottomLeft: Radius.circular(30))),
    );
  }
}

class _NotAvailable extends StatelessWidget {
  final Product product;

  const _NotAvailable({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String disponible = 'No disponible';
    if (product.available) {
      disponible = 'Dispobible';
    }
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: FittedBox(
        fit: BoxFit.contain,
        child: Text(
          disponible,
          style: TextStyle(fontSize: 20, color: Colors.black),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ),
      decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), bottomRight: Radius.circular(30))),
    );
  }
}
