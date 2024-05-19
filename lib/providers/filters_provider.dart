import 'package:flutter_riverpod/flutter_riverpod.dart';
enum Filter{  //* This file is responsible for Filters , This is written with Riverpod Approach and helps to keep a track of the filters applied by the user 
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan
 }
class FiltersNotifier extends StateNotifier <Map<Filter,bool>>{
  FiltersNotifier()
  :super({
Filter.glutenFree:false, //! Do not use = here to assign values you should rather use : to assign Values here 
Filter.vegetarian:false, //? These are the Initial Values that The Filters will Have 
Filter.lactoseFree:false,
Filter.vegan:false
  });


 void setFilters(Map<Filter,bool> chosenFilters){  ///! Make sure to define this func above the setilter or else it will give errors 
  state=chosenFilters;
}
void setFilter (Filter filter , bool isActive ){ //? This will check if the value of any Finter is Changed and will change the result accordingly 
state = {
  ...state , filter:isActive 
};
}
}


final filtersprovider= StateNotifierProvider<FiltersNotifier,Map<Filter,bool>>((ref) => FiltersNotifier());