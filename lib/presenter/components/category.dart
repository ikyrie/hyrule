import 'package:flutter/material.dart';

import '../../utils/consts/categories_images.dart';
import '../screens/results.dart';

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
