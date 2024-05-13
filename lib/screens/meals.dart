import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
//* This file contains the structure of the meal screen
class Mealscreen extends StatelessWidget {
  const Mealscreen({super.key, required this.meals, required this.title});
  final String title;
  final List<Meal> meals;
  @override
  Widget build(BuildContext context) {
    Widget content =  //? This is the widget that will be displayed on the meal screen 
        ListView.builder(itemCount:meals.length ,itemBuilder: (ctx, index) => Text(meals[index].title));
   
    if (meals.isEmpty) { //? If there are no meals in the category then this will be displayed
      content = Center(  //! Do not write context = Center else it will give error
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Uh oh ... Nothing Here ",
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge! //? headlineLarge is the size of the text
                  .copyWith(color: Theme.of(context).colorScheme.onBackground), //? This style is used to style the text displayed on the screen based on the theme
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              "Try Selecting A Different Category!", //? This is the text that will be displayed on the screen
              style: Theme.of(context) //? This style is used to style the text displayed on the screen based on the theme
                  .textTheme
                  .bodyLarge! //? bodyLarge is the size of the text
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            )
          ],
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: content,
    );
  }
}
