import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';

//* This File Contains the Meal Details Screen
class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({super.key, required this.meal});
  final Meal meal;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(meal.title)),
        body: Column(
          children: [
            Image.network(
              meal.imageUrl,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 14),
            Text(
                'Ingredients', //? This Is  A Title Foe Meal Ingredients 
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 14),
            for (final ingredients in meal.ingredients) //? This is the contents for Meal Preperation ingredients 
              Text(
                ingredients,
                textAlign: TextAlign
                    .center, 
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
            const SizedBox(height: 14),
            Text('Steps',  //? This is a Title  for Meal Preperation Steps in Meal Details
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold))
          ],
        ));
  }
}
