import 'package:flutter/material.dart';

import '../models/product.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  const ProductItem(this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(product.imageUrl),
      ),
      title: Text(product.name),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: [
            IconButton(
              onPressed: () {},
              color: Theme.of(context).colorScheme.primary,
              icon: const Icon(Icons.edit),
            ),
            IconButton(
              onPressed: () {},
              color: Theme.of(context).colorScheme.error,
              icon: const Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }
}
