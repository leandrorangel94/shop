import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/models/product.dart';
import 'package:shop/utils/app_routes.dart';

class ProductGridItem extends StatelessWidget {
  const ProductGridItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);

    return GridTile(
      child: GestureDetector(
        child: Image.network(
          product.imageUrl,
          fit: BoxFit.cover,
        ),
        onTap: () {
          Navigator.of(context).pushNamed(
            AppRoutes.PRODUCT_DETAIL,
            arguments: product,
          );
        },
      ),
      footer: GridTileBar(
        backgroundColor: Colors.black87,
        leading: Consumer<Product>(
          builder: (ctx, product, _) => IconButton(
            onPressed: () {
              product.toggleFavorite();
            },
            icon: Icon(
              product.isFavorite ? Icons.favorite : Icons.favorite_border,
            ),
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        title: Text(
          product.name,
          textAlign: TextAlign.center,
        ),
        trailing: IconButton(
          color: Theme.of(context).colorScheme.secondary,
          icon: const Icon(Icons.shopping_cart),
          onPressed: () {
            cart.addItem(product);
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text('Produto adicionado com sucesso!'),
                duration: const Duration(seconds: 2),
                action: SnackBarAction(
                  label: 'DESFAZER',
                  onPressed: () {
                    cart.removeSingleItem(product.id);
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
