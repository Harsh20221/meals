import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({required this.category});
  final Category category;

  @override

  ///! Make sure to write override's starting letter in small not capital
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        category.color.withOpacity(0.55),
        category.color.withOpacity(0.9)
      ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
      child: Text(category.title,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).colorScheme.onBackground)),
    );
  }
}
