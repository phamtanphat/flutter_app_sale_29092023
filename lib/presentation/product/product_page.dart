import 'package:flutter/material.dart';
import 'package:flutter_app_sale_29092023/common/base/base_widget.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return PageContainer(
      providers: [],
      child: Container(),
      appBar: AppBar(
        title: Text("Product"),
      ),
    );
  }
}
