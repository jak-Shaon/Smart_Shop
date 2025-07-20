import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_shop/app.dart';
import 'package:smart_shop/providers/auth_provider.dart';
import 'package:smart_shop/providers/cart_provider.dart';
import 'package:smart_shop/providers/product_provider.dart';
import 'package:smart_shop/providers/theme_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const SmartShopApp(),
    ),
  );
}
