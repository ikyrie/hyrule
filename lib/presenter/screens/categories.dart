import 'package:flutter/material.dart';
import 'package:hyrule/utils/consts/categories_images.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  final bool _isActive = false;

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
          child: CustomScrollView(
            slivers: [
              SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 1.0,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return Category(imageURL: categoriesImages[index], isActive: false,);
                  },
                  childCount: categoriesImages.length,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Category extends StatelessWidget {
  const Category({
    super.key, required this.imageURL, this.isActive = false,
  });
  final String imageURL;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(width: 2.0, color: const Color(0xFF00497D)),
        boxShadow: [
          BoxShadow(
              blurRadius: 6.0,
              color: const Color(0XFF00EBFF).withOpacity(0.2),
              blurStyle: BlurStyle.outer)
        ],
      ),
      margin: EdgeInsets.zero,
      child: Center(
        child: Image(
          image: AssetImage(imageURL),
        ),
      ),
    );
  }
}
