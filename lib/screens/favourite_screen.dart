import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_shop/providers/product_provider.dart';
import 'package:smart_shop/widgets/product_card.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final favouriteProducts = productProvider.products
        .where((product) => productProvider.isFavourite(product.id))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite Products'),
      ),
      body: favouriteProducts.isEmpty
          ? const Center(
        child: Text('No favourites added yet!'),
      )
          : ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: favouriteProducts.length,
        itemBuilder: (ctx, i) => Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: ProductCard(product: favouriteProducts[i]),
        ),
      ),
    );
  }
}
