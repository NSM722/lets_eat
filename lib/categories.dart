import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select a category'),
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // set the number of columns = 2
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: const [
          Text(
            'Uno',
            style: TextStyle(color: Colors.white),
          ),
          Text(
            'Dos',
            style: TextStyle(color: Colors.white),
          ),
          Text(
            'Tres',
            style: TextStyle(color: Colors.white),
          ),
          Text(
            'Quatro',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
