import 'package:flutter/material.dart';
import 'main.dart';
class EditProductScreen extends StatefulWidget {
  final Product product;
  final Function(Product, Product) onEdit;

  EditProductScreen(this.product, {required this.onEdit});

  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  late TextEditingController nameController;
  late TextEditingController descriptionController;
  late TextEditingController priceController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.product.name);
    descriptionController = TextEditingController(text: widget.product.description);
    priceController = TextEditingController(text: widget.product.price.toString());
  }

  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chỉnh sửa sản phẩm'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
            ElevatedButton(
              onPressed: () {
                Product editedProduct = Product(
                  name: nameController.text,
                  description: descriptionController.text,
                  price: double.parse(priceController.text),
                  image: widget.product.image,
                );

                widget.onEdit(widget.product, editedProduct);

                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
