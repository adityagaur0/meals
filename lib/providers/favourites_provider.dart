/* 
idea to is to build the provider which store the favourite meals
into list of favourite meals.
*/

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/meal_item.dart';

/*
here me dont use provider class as it is used for static dummy data
. like in meals_provider (a list that never changes).
for complex data that should change under certian circumstances
use StateNotifierProvider clause ,optimised for the data that can change.
*/

/*
StateNotifier class is instantiated : 
- Build your own class that extend this class StateNotifier
- after statenotifier angular brackets to tell riverpod which kind of 
  data will be managed by the notifier.
- here we manage list of meals.
- with that we can fill this class with some life.
- life A: the initial value (initial empty list)
- life B: all the methods that exist to change the value in this class.
*/
class FavouriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavouriteMealsNotifier() : super([]);
  //A, constructor , super to reach to parent class, and pass,i.e. we pass initial data type.

  //
  bool toggleMealFavouriteStatus(Meal meal) {
    /*B ,this function adds the meal to favourite or remove it if no needed.
    - same as we did in tabs.dart given below. but here we do differently
    - but logic will be same as below
    - ***IMPORTANT**** == NEVER EDIT THE VALUE ,MANAGED BY THE NOTIFIER (like super([]))
    - in state notifier, we are not allow to edit the  existing value in 
       the memory insted create new one.
       (matlab naya banao porrane ko edit na karo) EXAMPLE cant use .add or .remove 
       instead replace it.
    - to replace we have global property called `state`.
    - `state` property hold your data.
    - state.add or remove not allowed instead we can reassign it using assignment
      operator `=` to a new list .

    1. first check wether the meal is the part of list or not.
       use 'state.contain(meal)'. 
    2. if the meal is in the fav list , Remove it 
       use `state= state.where()` cuz using `where` we filter the list and get the
       new list. `where` get the fn (eg mealItem) where we get current item after item and we 
       had to return true if we wanna keep it or drop it.
       -(aka matlab where ek naya list create krta . hum usmein baari baari se poorane 
         list ke elemets daalte and voh unn old element ko add ya drop krta nayi
         list mein)
       to yaha hum mealItem.id aagr meal.id ke equal nahi hai to agar true aaya 
       to voh mealItem remove ho jayega vrna add.
    3. add meal we use state = new list , here we wana keep the all the existing 
       item plus new one. by using `...state` to pull out all the 
       existing element and put to new list also add new `meal` to the list.

  WITHOUT MUTATUING THE LIST WE UPATED IT .
    */
    final mealIsFavourite = state.contains(meal);
    //remove meal
    if (mealIsFavourite) {
      state = state.where((MealItem) => MealItem.id != meal.id).toList();
      return false; // use to show snackbar in meals detial screen
    } else {
      // add meals
      state = [...state, meal];
      return true; // use to show snackbar in meals detial screen
    }
  }
  /*
  like this:
   void _toggleMealFavoriteStatus(Meal meal) {
    //use this function in meals details screen
    final isExisting = _favoriteMeals.contains(meal);
    if (isExisting) {
      setState(() {
        _favoriteMeals.remove(meal);
        _showInfoMessage("Meal is no longer a favourite.");
      });
    } else {
      setState(() {
        _favoriteMeals.add(meal);
        _showInfoMessage("Marked as favourite!");
      });
    }
  }
   */
}

// this below StateNotifierProvider is generic type thus it understant that it return
// the FavouriteMealsNotifier BUT not able to understand which type of data
// this is yielding in the end so we pass two generic type definations.
// first one is the FavouriteMealsNotifier and the data it is yielding List<Meals>.
final favouriteMealsProvider =
    StateNotifierProvider<FavouriteMealsNotifier, List<Meal>>((ref) {
  return FavouriteMealsNotifier();
});
