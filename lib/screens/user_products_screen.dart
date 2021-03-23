import 'package:first_app/providers/products.dart';
import 'package:first_app/screens/edit_product_screen.dart';
import 'package:first_app/widgets/app_drawer.dart';
import 'package:first_app/widgets/user_product_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserProductsScreen extends StatelessWidget {
  static const routeName = '/user-product';
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Products'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () =>
                Navigator.of(context).pushNamed(EditProductScreen.routeName),
          )
        ],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: productsData.items.length,
          itemBuilder: (context, index) => Column(
            children: [
              UserProductItem(productsData.items[index].id,productsData.items[index].title,
                  productsData.items[index].imageUrl),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
