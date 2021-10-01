import 'package:flutter/material.dart';

class ProductCatalog extends StatelessWidget {
  const ProductCatalog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Catalog'),
      ),
      body: Center(),
    );
  }
}
