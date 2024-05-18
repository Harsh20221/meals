import 'package:flutter/material.dart';
 //* This file contains the filter screen 
 enum Filter{
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan
 }
class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key,required this.currentFilters});
  final Map<Filter,bool> currentFilters;
  @override
  State<FiltersScreen> createState() {
    return _FiltersScreenState();
  }
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _gluttenFreeFilterset = false;  //? tHIS Value will store the default value of the Toggle Button as false 
  var _lactoseFreeFilterset=false; 
  var vegatarianFilterset=false;
  var _veganFilterset=false;
  @override
  void initState() {
    super.initState();
    _gluttenFreeFilterset = widget.currentFilters[Filter.glutenFree]!;
    _lactoseFreeFilterset = widget.currentFilters[Filter.lactoseFree]!;
    vegatarianFilterset = widget.currentFilters[Filter.vegetarian]!;
    _veganFilterset = widget.currentFilters[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filters"),
      ),
      body: PopScope( canPop: false,onPopInvoked: (bool didPop){ //# This popscope will Help in Providing filters Functionality , Manages back navigation gestures in App
        if(didPop )return; Navigator.of(context).pop({
          Filter.glutenFree:_gluttenFreeFilterset,
         Filter.lactoseFree: _lactoseFreeFilterset,
         Filter.vegetarian:vegatarianFilterset,
         Filter.vegan:_veganFilterset,
        });
      },
        child: Column(
          children: [
            SwitchListTile(
              value: _gluttenFreeFilterset,
              onChanged: (ischecked) {setState(() {
                _gluttenFreeFilterset=ischecked;//todo: Make sure to assign is checked to _gluttenfreeFilterSet in order to check if the Toggle is on or Off 
              });},  //? is Checked will check if the ToggleButton is pressed on or off 
              title: Text(
                "Gluten Free",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: const Text("Only includes Gluten-Free Meals "),
              activeColor: Theme.of(context).colorScheme.tertiary,
            )
          ,  SwitchListTile(
              value: _lactoseFreeFilterset,
              onChanged: (ischecked) {setState(() {
                _lactoseFreeFilterset=ischecked;
              });}, 
              title: Text(
                "Lactose Free ",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: const Text("Only includes Lactose-Free Meals "),
              activeColor: Theme.of(context).colorScheme.tertiary,
            ),  SwitchListTile(
              value: vegatarianFilterset,
              onChanged: (ischecked) {setState(() {
                vegatarianFilterset=ischecked;
              });}, 
              title: Text(
                "Vegetarian",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: const Text("Only includes Vegetarian Meals "),
              activeColor: Theme.of(context).colorScheme.tertiary,
             ), SwitchListTile(
              value: _veganFilterset,
              onChanged: (ischecked) {setState(() {
                _veganFilterset=ischecked;
              });}, 
              title: Text(
                "Vegan",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: const Text("Only includes Vegan  Meals "),
              activeColor: Theme.of(context).colorScheme.tertiary,
            )],
        ),
      ),
    );
  }
}
