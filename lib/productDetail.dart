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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                product.image,
                width: 300.0,
                height: 300.0,
              ),
              SizedBox(height: 16.0),
              Text(
                'Tên sản phẩm:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              Text(product.name),
              Divider(height: 20.0, color: Colors.grey),
              Text(
                'Mô tả:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              Text(product.description),
              Divider(height: 20.0, color: Colors.grey),
              Text(
                'Giá:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              Text('${product.price.toStringAsFixed(0)} VND'),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Back'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
