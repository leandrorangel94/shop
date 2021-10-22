import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/product.dart';
import 'package:shop/models/products_list.dart';
import 'package:shop/utils/app_routes.dart';

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
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(AppRoutes.PRODUCT_FORM, arguments: product);
              },
              icon: const Icon(Icons.edit),
              color: Colors.amberAccent,
            ),
            IconButton(
                onPressed: () {
                  showDialog<bool>(
                      context: context,
                      builder: (ctx) => AlertDialog(
                            title: const Text('Excluir produto'),
                            content: const Text('Quer remover o produto?'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop(false);
                                },
                                child: const Text('Não'),
                              ),
                              TextButton(
                                onPressed: () =>
                                    Navigator.of(context).pop(true),
                                child: const Text('Sim'),
                              ),
                            ],
                          )).then((value) {
                    if (value ?? false) {
                      Provider.of<ProductsList>(context, listen: false)
                          .removeProduct(product);
                    }
                  });
                },
                icon: const Icon(Icons.delete),
                color: Theme.of(context).colorScheme.secondary),
          ],
        ),
      ),
    );
  }
}
