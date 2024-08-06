import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/cart_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context).cart;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Cart'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(
                        'Clear the Cart',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      content:
                          const Text('Are You Sure You want to Clear the Cart'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            "No",
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Provider.of<CartProvider>(context, listen: false)
                                .clearCart();
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            "Yes",
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text(
                'Delete All',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
      body: cart.isEmpty
          ? Center(
              child: Text(
                'The Cart looks Empty',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            )
          : ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('${cart[index]["imageUrl"]}'),
                  ),
                  title: Text(
                    '${cart[index]['title']}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  subtitle: Text('Size: ${cart[index]['size']}'),
                  trailing: IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(
                              'Delete Product',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            content: const Text(
                                'Are You Sure You want to delete the product'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text(
                                  "No",
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Provider.of<CartProvider>(context,
                                          listen: false)
                                      .removeProduct(cart[index]);
                                  Navigator.of(context).pop();
                                },
                                child: const Text(
                                  "Yes",
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ),
                );
              },
            ),
    );
  }
}
