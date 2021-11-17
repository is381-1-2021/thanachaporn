import 'dart:async';

import 'package:moodish/models/product_model.dart';
import 'package:moodish/services/services.dart';

class ProductController {
  final Services services;
  List<ProductModel> products = List.empty();

  StreamController<bool> onSyncController = StreamController();
  Stream<bool> get onSync => onSyncController.stream;

  ProductController(this.services);

  Future<List<ProductModel>> fetchProducts() async {
    onSyncController.add(true);
    products = await services.getProducts();
    onSyncController.add(false);

    return products;
  }
}
