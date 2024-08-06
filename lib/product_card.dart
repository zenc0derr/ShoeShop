import 'package:flutter/material.dart';
import 'package:shop_app/global_variables.dart';

class ProductCard extends StatelessWidget {
  final int index;
  const ProductCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: index.isEven
              ? const Color.fromRGBO(216, 240, 253, 1)
              : const Color.fromRGBO(245, 247, 249, 1),
          borderRadius: const BorderRadius.all(Radius.circular(20))),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            products[index]['title'].toString(),
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            '\$${products[index]['price']}',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(
            height: 5,
          ),
          Center(
            child: Image(
              image: AssetImage('${products[index]['imageUrl']}'),
              height: 175,
            ),
          )
        ],
      ),
    );
  }
}
