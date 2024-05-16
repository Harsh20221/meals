import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';

//* This File Contains the Meal Details Screen
class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({super.key, required this.meal,required this.onToggleFavourite});
  final Meal meal;
  final void Function(Meal meal) onToggleFavourite;  //? Do not write () after ontoggle Favourite as we are assigning it and not using it 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(meal.title),
          actions: [IconButton(onPressed: () {onToggleFavourite(meal);}, icon: Icon(Icons.star))], //! Very important-- Do  not forget to assign  onToggleFavourite here as we are calling it here with (meal)
        ), //# Added favourite Icon for tabs
        body: ListView(
          //? Displays Meal Details in ListView
          children: [
            Image.network(
              //? Gets Image of Meal through URL
              meal.imageUrl,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 14),

            Text('Ingredients', //? This Is  A Title Foe Meal Ingredients
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 14),
            for (final ingredients in meal
                .ingredients) //? This is the contents for Meal Preperation ingredients
              Text(
                ingredients,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
            const SizedBox(height: 14),
            Text(
                'Steps', //? This is a Title  for Meal Preperation Steps in Meal Details
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 14),
            for (final step
                in meal.steps) //? These are Contents for Meal Preperation Steps
              Padding(
                //! Make sure to enclose all the Data Inside Padding itself using a child Widghet else it will  Give An Error
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                child: Text(
                  step,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
              )
          ],
        ));
  }
}
