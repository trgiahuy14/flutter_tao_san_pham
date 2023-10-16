import 'package:flutter/material.dart';
import 'main.dart';
import 'listProduct.dart';
class ProductDetailScreen extends StatelessWidget {
  final Product product;

  ProductDetailScreen(this.product);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chi tiết sản phẩm'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(product.image),
            Text('Tên sản phẩm: ${product.name}'),
            Text('Mô tả: ${product.description}'),
            Text('Giá: ${product.price.toStringAsFixed(0)}'),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}
