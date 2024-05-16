/////import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/models/meal.dart';
//* This File Is responsible for Tab Based Navigation , Bottom Tabs bar 
class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});
  @override
  State<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex =
      0; //? This line of code keeps track of the Selected tab
      final List <Meal> _favouriteMeals =[];
void _ShowinfoMessage(String message){
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text(message),duration:Duration( seconds:30 ),));
}

      void _togglemealfavouritestatus(Meal meal){ //? This'll help in toggling the favourite status of the meal 
      final isexisting=_favouriteMeals.contains(meal);
      if(isexisting==true){
        setState(() {
          _favouriteMeals.remove(meal);
        });
        _ShowinfoMessage("Meal is No Longer A Favorite! ");
      }
      else setState(() {
         _favouriteMeals.add(meal);
      });
      _ShowinfoMessage("Meal is Added to Favorites!");
      }
      
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex =
          index; //? This helps in keeping Track of selected  tab index
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activepage =
           CategoriesScreen(onToggleFavourite: _togglemealfavouritestatus,); //# This widget function makes sure we display categories screen if the choice of tab is default or zero we can say
    var activePageTitle = 'Categories';
    if (_selectedPageIndex == 1) {
      //? This changes the Active page from Categories to Favouries if we change it from the tabs menu
      activepage = Mealscreen(
        meals: _favouriteMeals, //!   This line make sures we use mealscreen but since list is empty so we do not display dummy data from meals screen , Do not forget to pass _favouriteMeals list here
      onToggleFavourite:_togglemealfavouritestatus ,); //# it'll make sure if a particular item is already favourite then remove it from favourites and if it is not favourite then add it to favourites  
      activePageTitle = 'Your Favourites ';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      body: activepage, //! The default active page is Categories screen 
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              //? Thease are widgets for displaying menu
              icon: Icon(Icons.set_meal),
              label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favourites')
        ],
        onTap:
            _selectPage, //! Make sure to assign selectpage function here so that the menu can be use to change Page BETWEEN Category and Favourites
     currentIndex: _selectedPageIndex, )//? This line makes sure that in our tab once we click on any selected tab the tab bar change the highlight from default to selected tab , Whichever tab will be selected will be highlighted 
    );
  }
}
