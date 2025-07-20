import 'package:flutter/material.dart';
import 'package:smart_shop/screens/splash_screen.dart';
import 'package:smart_shop/screens/auth/login_screen.dart';
import 'package:smart_shop/screens/auth/register_screen.dart';
import 'package:smart_shop/screens/home_screen.dart';
import 'package:smart_shop/screens/cart_screen.dart';
import 'package:smart_shop/screens/favourite_screen.dart';
import 'package:smart_shop/screens/profile_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';
  static const String cart = '/cart';
  static const String favourites = '/favourites';
  static const String profile = '/profile';

  static Map<String, WidgetBuilder> get routes => {
    splash: (context) => const SplashScreen(),
    login: (context) => const LoginScreen(),
    register: (context) => const RegisterScreen(),
    home: (context) => const HomeScreen(),
    cart: (context) => const CartScreen(),
    favourites: (context) => const FavouriteScreen(),
    profile: (context) => const ProfileScreen(),
  };
}
