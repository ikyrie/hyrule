import 'package:flutter/material.dart';

import '../../utils/consts/categories_images.dart';
import 'results.dart';

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

class Category extends StatelessWidget {
  const Category({super.key, required this.category});
  final String category;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Results(
              category: category,
            ),
          ),
        );
      },
      borderRadius: BorderRadius.circular(16.0),
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          border: Border.all(width: 2.0, color: const Color(0xFF0079CF)),
          boxShadow: [
            BoxShadow(
                blurRadius: 6.0,
                color: const Color(0XFF0079CF).withOpacity(0.2),
                blurStyle: BlurStyle.outer)
          ],
        ),
        child: Center(
          child: Image(
            color: const Color(0xFF0079CF),
            image: AssetImage('$path$category.png'),
          ),
        ),
      ),
    );
  }
}
