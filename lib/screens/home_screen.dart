import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_shop/models/product_model.dart';
import 'package:smart_shop/providers/product_provider.dart';
import 'package:smart_shop/widgets/product_card.dart';

import '../providers/cart_provider.dart';
import '../routes/app_routes.dart';
import '../widgets/custom_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<ProductProvider>(context, listen: false).loadProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    // Determine the sort text label based on currentSort enum
    String sortText = 'Sort by';
    switch (productProvider.currentSort) {
      case SortOption.priceLowToHigh:
        sortText = 'Price: Low to High';
        break;
      case SortOption.priceHighToLow:
        sortText = 'Price: High to Low';
        break;
      case SortOption.ratingHighToLow:
        sortText = 'Rating: High to Low';
        break;
      default:
        sortText = 'Sort by';
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Smart Shop'),
        actions: [
          PopupMenuButton<SortOption>(
            icon: const Icon(Icons.sort),
            onSelected: (SortOption selected) {
              Provider.of<ProductProvider>(context, listen: false)
                  .sortProducts(selected);
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: SortOption.priceLowToHigh,
                child: Text('Price: Low to High'),
              ),
              const PopupMenuItem(
                value: SortOption.priceHighToLow,
                child: Text('Price: High to Low'),
              ),
              const PopupMenuItem(
                value: SortOption.ratingHighToLow,
                child: Text('Rating: High to Low'),
              ),
            ],
          ),
          Consumer<CartProvider>(
            builder: (context, cartProvider, _) => Stack(
              alignment: Alignment.topRight,
              children: [
                IconButton(
                  icon: const Icon(Icons.shopping_cart),
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.cart);
                  },
                ),
                if (cartProvider.itemCount > 0)
                  Positioned(
                    right: 6,
                    top: 6,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        cartProvider.itemCount.toString(),
                        style: const TextStyle(
                          fontSize: 10,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
      drawer: const CustomDrawer(),
      body: productProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              sortText,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () => productProvider.loadProducts(),
              child: ListView.builder(
                itemCount: productProvider.products.length,
                itemBuilder: (context, index) {
                  final product = productProvider.products[index];
                  return ProductCard(product: product);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
