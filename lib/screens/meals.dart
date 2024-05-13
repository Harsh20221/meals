import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
class Mealscreen extends StatelessWidget {
  const Mealscreen ({super.key , required this.meals , required this.title});
  final String title;
  final List <Meal> meals;
  @override
Widget build( BuildContext context){
return Scaffold(appBar: AppBar(title:Text(title),));
}
}