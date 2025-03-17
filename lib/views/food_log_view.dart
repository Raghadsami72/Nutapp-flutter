import 'package:flutter/material.dart';
import '../models/food_entry.dart';

class FoodLogView extends StatelessWidget {
  final List<FoodEntry> foodLog;

  const FoodLogView({super.key, required this.foodLog});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: foodLog.length,
      itemBuilder: (context, index) {
        final entry = foodLog[index];
        return ListTile(
          title: Text(entry.name),
          subtitle: Text('${entry.calories} calories'),
          trailing: Text(entry.timestamp.toString()),
        );
      },
    );
  }
}
