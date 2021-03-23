import 'package:first_app/providers/cart.dart';
import 'package:first_app/providers/orders.dart';
import 'package:first_app/providers/products.dart';
import 'package:first_app/screens/cart_screen.dart';
import 'package:first_app/screens/edit_product_screen.dart';
import 'package:first_app/screens/edit_product_screen.dart';
import 'package:first_app/screens/orders_screen.dart';
import 'package:first_app/screens/product_detail_screen.dart';
import 'package:first_app/screens/products_overview_screen.dart';
import 'package:first_app/screens/user_products_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          // Here is better use create methods and default constructor
          create: (_) => Products(),
        ),
        ChangeNotifierProvider(
          // Here is better use create methods and default constructor
          create: (_) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (_) => Orders(),
        ),
      ],
      child: MaterialApp(
          title: 'MyShop',
          theme: ThemeData(
            primarySwatch: Colors.purple,
            accentColor: Colors.deepOrange,
            fontFamily: 'Lato',
          ),
          home: ProductsOverViewScreen(),
          routes: {
            ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
            CartScreen.routeName: (ctx) => CartScreen(),
            OrdersScreen.routeName: (ctx) => OrdersScreen(),
            UserProductsScreen.routeName: (ctx) => UserProductsScreen(),
            EditProductScreen.routeName: (ctx) => EditProductScreen(),
          }),
    );
  }
}
