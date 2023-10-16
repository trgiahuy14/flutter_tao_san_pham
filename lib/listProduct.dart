import 'package:flutter/material.dart';
import 'productDetail.dart';
import 'main.dart';
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(

              elevation: 4.0,
              child: Padding(
                padding: EdgeInsets.all(16.0),

              child: Row(

                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Container(

                    width: 150,
                    height: 118,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(product.image),
                    ),
                  ),
                  SizedBox(width: 16.0),

                  // Thông tin bên phải
                  Expanded(

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tên sản phẩm: ${product.name}',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text('Mô tả: ${product.description}'),
                        Text('Giá: ${product.price.toStringAsFixed(0)} VND'),
                        SizedBox(height: 8.0),
                        ElevatedButton.icon(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ProductDetailScreen(product),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                          ),
                          icon: Icon(Icons.open_in_new),
                          label: Text('Chọn'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
            ),
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
    );
  }
}
