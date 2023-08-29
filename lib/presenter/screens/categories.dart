import 'package:flutter/material.dart';

import '../../utils/consts/categories_images.dart';
import '../components/category.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Escolha a categoria:'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(17.0),
          child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
            ),
            children:
                categories.keys.map((e) => Category(category: e)).toList(),
          ),
        ),
      ),
    );
  }
}