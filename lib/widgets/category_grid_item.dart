import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({required this.category, required this.onSelectCategory});
  final Category category;
  final void Function() onSelectCategory; //! Make sure to write function with F in Capital 

  @override

  ///! Make sure to write override's starting letter in small not capital
  Widget build(BuildContext context) {
    return InkWell(
      //# This inkwell widget helps to get a Tapping effect on the grid items , In easier words we can say that IT converts grid items to Buttons
      onTap: () {},
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration( borderRadius: BorderRadius.circular(16), //?Set border radius inside the container to get circular Grid of items 
            gradient: LinearGradient(colors: [
          category.color.withOpacity(0.55),
          category.color.withOpacity(0.9)
        ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        child: Text(category.title,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground)),
      ),
    );
  }
}
