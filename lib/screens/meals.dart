import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
class Mealscreen extends StatelessWidget {
  const Mealscreen ({super.key , required this.meals , required this.title});
  final String title;
  final List <Meal> meals;
  @override
Widget build( BuildContext context){
Widget content = ListView.builder(itemBuilder: (ctx,index)=> Text(meals[index].title));
if (meals.isEmpty){
  content=Center(child: Column(mainAxisSize: MainAxisSize.min,children: [Text("Uh oh ... Nothing Here ",style: Theme.of(context).textTheme.headlineLarge!.copyWith(color:Theme.of(context).colorScheme.onBackground),),SizedBox(height: 16,),Text("Try Selecting A Different Category!",style:Theme.of(context).textTheme.bodyLarge!.copyWith(color: Theme.of(context).colorScheme.onBackground) ,)],),
  );
}
return Scaffold(appBar: AppBar(title:Text(title)),body:content ,);
}
}