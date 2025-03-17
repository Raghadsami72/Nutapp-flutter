import 'package:flutter/material.dart';
import '../models/grocery_item.dart';

class GroceryView extends StatelessWidget {
  final List<GroceryItem> groceryList;

  const GroceryView({super.key, required this.groceryList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: groceryList.length,
      itemBuilder: (context, index) {
        final item = groceryList[index];
        return ListTile(
          title: Text(item.name),
          trailing: Checkbox(
            value: item.purchased,
            onChanged: (value) {},
          ),
        );
      },
    );
  }
}
