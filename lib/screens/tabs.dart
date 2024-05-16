/////import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/meals.dart';
 //* This File Is responsible for Tab Based Navigation 
class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});
  @override
  State<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0; //? This line of code keeps track of the Selected tab 
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;  //? This helps in keeping Track of selected  tab index 
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activepage = const CategoriesScreen(); //# This widget function makes sure we display categories screen if the choice of tab is default or zero we can say 
    var activePageTitle= 'Categories';
    if (_selectedPageIndex == 1) { //? This changes the Active page from Categories to Favouries if we change it from the tabs menu 
      activepage = Mealscreen(
        title: 'Favorites',
        meals: [],  //!   This line make sures we use mealscreen but since list is empty so we do not display dummy data from meals screen 
      );
      activePageTitle='Your Favourites ';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      body: activepage,
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem( //? Thease are widgets for displaying menu 
              icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favourites')
        ],
        onTap: (index) {}, 
      ),
    );
  }
}
