import 'package:flutter/material.dart';
import '../models/cart_item.dart';
import '../widgets/product_image.dart';

class CartScreen extends StatefulWidget {
  final List<CartItem> cartItems;

  const CartScreen({super.key, required this.cartItems});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late List<CartItem> items;

  @override
  void initState() {
    super.initState();
    items = List.from(widget.cartItems);
  }

  double get total => items.fold(0, (sum, item) => sum + item.total);

  void changeQuantity(int index, int delta) {
    setState(() {
      items[index].quantity += delta;
      if (items[index].quantity <= 0) {
        items.removeAt(index);
      }
    });
  }

  void confirmPurchase() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Siparişiniz Alındı 🎉'),
        content: Text('Toplam ${total.toStringAsFixed(2)} TL tutarındaki siparişiniz oluşturuldu.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context, <CartItem>[]);
            },
            child: const Text('Tamam'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sepetim'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context, items),
        ),
      ),
      body: items.isEmpty
          ? const Center(child: Text('Sepetiniz boş'))
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    leading: SizedBox(
                      width: 50,
                      height: 50,
                      child: ProductImage(imagePath: item.product.imagePath),
                    ),
                    title: Text(item.product.name),
                    subtitle: Text('${item.product.price.toStringAsFixed(2)} TL x ${item.quantity}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: () => changeQuantity(index, -1),
                        ),
                        Text('${item.quantity}'),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () => changeQuantity(index, 1),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      bottomNavigationBar: items.isEmpty
          ? null
          : Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Toplam: ${total.toStringAsFixed(2)} TL', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  ElevatedButton(
                    onPressed: confirmPurchase,
                    child: const Text('Ödemeye Geç'),
                  ),
                ],
              ),
            ),
    );
  }
}