import 'package:flutter/material.dart';
import 'food_log_view.dart';
import 'grocery_view.dart';
import 'barcode_scanner.dart';
import 'profile_view.dart';
import '../models/food_entry.dart';
import '../models/grocery_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final List<FoodEntry> _foodLog = [];
  final List<GroceryItem> _groceryList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nutrition Tracker')),
      body: _getBody(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.lunch_dining), label: 'Food Log'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Grocery'),
          BottomNavigationBarItem(icon: Icon(Icons.qr_code_scanner), label: 'Scan'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addFoodEntry(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _getBody() {
    switch (_selectedIndex) {
      case 0:
        return FoodLogView(foodLog: _foodLog);
      case 1:
        return GroceryView(groceryList: _groceryList);
      case 2:
        return const BarcodeScanner();
      case 3:
        return const ProfileView();
      default:
        return const Center(child: Text('Something went wrong'));
    }
  }

  void _addFoodEntry(BuildContext context) {
    setState(() {
      _foodLog.add(FoodEntry(name: "Apple", calories: 95, timestamp: DateTime.now()));
    });
  }
}
