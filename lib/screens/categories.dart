//* This file contains all the Categories of Meals that'll be stored and also contains Navigation method 
import 'package:flutter/material.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/category_grid_item.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/category.dart';
class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});
void _selectcategory(BuildContext context, Category category){   //? This is responsible for Navigation from Home Screen to Meals Screen  
//! Make sure to not forget to write Category category inside the void function 

final filteredMeals=dummyMeals.where((meal) => meal.categories.contains(category.id)).toList();

  Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>Mealscreen(meals: [], title:category.title))); //? This is the function that will be called when a category is selected it will navigate to the next screen 
}



  @override
  Widget build(BuildContext context) {  
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pick Your Category"),
      ),
      body: GridView( padding: EdgeInsets.all(24),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.5,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        children: [
          for (final category in availableCategories)
            CategoryGridItem(category: category,onSelectCategory:(){_selectcategory(context,category);} ,) //! Do not forget to write category inside _selectcategory next to context
        ],  //? onSelectCategory is defined insode category_grid.dart
      ),
    );
  }
}
