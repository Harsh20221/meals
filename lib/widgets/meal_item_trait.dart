import 'package:flutter/material.dart';
////import 'package:meals/widgets/meal_item_trait.dart';
//////import 'package:meals/widgets/meal_item.dart';
//* This file will be used to create the meal item trait widget that will be used to display the meal item trait in the meal screen this'll store the metadata of the mealmeans it'll store the duration,complexity and the affordability of the meal
class MealItemTrait extends StatelessWidget {
  const MealItemTrait({super.key,required this.icon,required this.label});
  final IconData icon;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 17,
          color: Colors.white,
        ),
        const SizedBox(width: 6,),
        Text( label,style: const TextStyle(color: Colors.white), ),const SizedBox(height: 12,),
      ],
    );
  }
}
