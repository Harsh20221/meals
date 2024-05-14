import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal});
  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {},
        child: Stack(children: [FadeInImage(placeholder:MemoryImage(kTransparentImage), image: NetworkImage(meal.imageUrl)),Positioned(child: Container(),bottom: 0,left: 0,right: 0,)], //? This is the stack widget that will be used to stack the image and the text on top of each other
      ),
    ));
  }
}
