import 'dart:async';

import 'package:flutter_app_sale_29092023/common/base/base_bloc.dart';
import 'package:flutter_app_sale_29092023/common/base/base_event.dart';
import 'package:flutter_app_sale_29092023/data/model/product.dart';
import 'package:flutter_app_sale_29092023/data/repository/product_repository.dart';
import 'package:flutter_app_sale_29092023/presentation/product/product_event.dart';
import 'package:flutter_app_sale_29092023/util/parser/product_parser.dart';

class ProductBloc extends BaseBloc {
  ProductRepository? _productRepository;
  StreamController<List<Product>> _listProductController = StreamController();

  Stream<List<Product>> getListProductStream() => _listProductController.stream;

  void setProductRepo(ProductRepository repository) {
    _productRepository = repository;
  }

  @override
  void dispatch(BaseEvent event) {
    switch(event.runtimeType) {
      case GetListProductEvent:
        getListProduct();
        break;
    }
  }

  void getListProduct() {
    loadingSink.add(true);
    _productRepository?.getListProductsService()
        .then((productDTO) {
          List<Product> listProduct = productDTO.map((e) => ProductParser.parseProductDTO(e)).toList();
          _listProductController.add(listProduct);
        })
        .catchError((error) { messageSink.add(error); })
        .whenComplete(() => loadingSink.add(false));
  }

  @override
  void dispose() {
    super.dispose();
    _listProductController.close();
  }
}