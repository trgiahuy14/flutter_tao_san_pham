import "main.dart";
import 'package:flutter/material.dart';
import 'productDetail.dart';
class ListProductScreen extends StatelessWidget {
  final Product product;

  ListProductScreen(this.product);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Product'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start, // Để đảm bảo hình ảnh ở bên trái
          children: [
            // Hình ảnh bên trái
            Container(
              width: 100, // Đặt kích thước hình ảnh theo nhu cầu của bạn
              height: 100,
              child: Image.network(product.image),
            ),
            SizedBox(width: 16.0), // Khoảng cách giữa hình ảnh và thông tin

            // Thông tin bên phải
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Tên sản phẩm: ${product.name}'),
                  Text('Mô tả: ${product.description}'),
                  Text('Giá: ${product.price.toStringAsFixed(0)}'),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ProductDetailScreen(product),
                        ),
                      );
                    },
                    child: Text('Chọn'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Back'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
