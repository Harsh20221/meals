import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meal_details.dart';
import 'package:meals/widgets/meal_item.dart';
//* This file contains the structure of the meal screen
class Mealscreen extends StatelessWidget {
  const Mealscreen({super.key, required this.meals, required this.title});
  final String title;
  final List<Meal> meals; //? This is the list of meals that will be displayed on the screen
void  selectmeal (BuildContext context , Meal meal ){ //# This is the function that will be called when a meal is selected this'll help to redirect to another Screen containing meal details 
  Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>MealDetailsScreen(meal: meal)));
}
  @override
  Widget build(BuildContext context) {  //? This is the build method that will be called when the screen is built
    Widget content =  //# This is the content that will be displayed on the screen
        ListView.builder(itemCount:meals.length ,itemBuilder: (ctx, index) => MealItem(meal: meals[index],onSelctMeal: (meal){selectmeal(context, meal);},));
   
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
         const SizedBox(
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
