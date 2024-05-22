import 'package:flutter/material.dart';
import 'package:shopping__list/data/dummy_items.dart';

class GroceryList extends StatelessWidget {
  const GroceryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: const Text('Grocery List'),
        ),
        body: ListView.builder(
          itemCount: groceryItems.length,
          itemBuilder: (context, index) {
            final item = groceryItems[index];
            return ListTile(
              title: Text(item.name),
              trailing: Text(item.quantity.toString()),
              leading: Icon(
                Icons.folder,
                color: item.category.color,
              ),
            );
          },
        ));
  }
}
