import 'package:flutter/material.dart';
import 'listProduct.dart';
// https://via.placeholder.com/150

void main() {
  runApp(MyApp());
}

class Product {
  final String name;
  final String description;
  final double price;
  final String image;

  Product({required this.name, required this.description, required this.price, required this.image});
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProductForm(),
    );
  }
}

class ProductForm extends StatefulWidget {
  @override
  _ProductFormState createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController imageController = TextEditingController();

  List<Product> productList = [];

  void deleteProduct(Product product) {
    setState(() {
      productList.remove(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tạo sản phẩm'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
      child:Center(
        child: Column(
        children: [
          TextField(
            controller: nameController,
            decoration: InputDecoration(labelText: 'Tên sản phẩm'),
          ),
          TextField(
            controller: descriptionController,
            decoration: InputDecoration(labelText: 'Mô tả'),
          ),
          TextField(
            controller: priceController,
            decoration: InputDecoration(labelText: 'Giá'),
          ),
          TextField(
            controller: imageController,
            decoration: InputDecoration(labelText: 'Image URL'),
          ),
          ElevatedButton(
            onPressed: () {
              Product product = Product(
                name: nameController.text,
                description: descriptionController.text,
                price: double.parse(priceController.text),
                image: imageController.text,
              );
              setState(() {
                productList.add(product);
              });
              // Xóa nội dung trường văn bản sau khi bấm Save
              nameController.clear();
              descriptionController.clear();
              priceController.clear();
              imageController.clear();
            },
            child: Text('Save'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: productList.length,
              itemBuilder: (context, index) {
                Product product = productList[index];
                return Column(
                  children: [
                    ListTile(
                      title: Text('Tên sản phẩm: ${product.name}'),
                      subtitle: Text('Mô tả: ${product.description}'),
                      trailing: Text('Giá: ${product.price.toStringAsFixed(0)}'),
                      leading: Image.network(product.image),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // Handle "View" button click
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ListProductScreen(product),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green, // Đặt màu xanh lá cho nút "View"
                          ),
                          child: Text('View', style: TextStyle(color: Colors.white)),
                        ),
                        ElevatedButton(
                          onPressed: () {

                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.orange,
                          ),
                          child: Text('Edit'),
                        ),
                        ElevatedButton(
                          onPressed: () {

                            deleteProduct(product);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                          ),
                          child: Text('Delete', style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    ),
      ),
    );

  }
}

