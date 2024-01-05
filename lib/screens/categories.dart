import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/category.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/category_grid_item.dart';

//Section 9: {A.} To make an explicit animation convert this stateless to statefull widget
//- to convert to statefull . right click , go to refactor and convert it
class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen(
      {super.key,
      //required this.onToggleFavourite, ** NO NEED CUZ OF PROVIDER
      required this.availableMeals});
  //final void Function(Meal meal) onToggleFavourite;  ** NO NEED CUZ OF PROVIDER
  final List<Meal> availableMeals;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController //class
      _animationController; // {B. }animation controller must be set before build.
//late is used to tell dart that it is fine, once the property is used . it will have a value.

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
      // animationcontroller class constructor function
      /*{C. }
      vsync wants a ticker provider,this vsync make sure this animation executes 
      for every frame for smooth transition(60 times per sec).
      This ticker provider is recieved by vsync by adding feature called 
      (for explicit animations only) `with`(keyword: this with keyword allows 
      to add mixin to a class) and class mixin here is `SingleTickerProviderStateMixin`
      (this mixin class provide various feature needed by flutter animation sys.)
      single for single animation controller and for many animation controller
      use TickerProviderStateMixin.
       */
      vsync: this, //always req
      duration: const Duration(
          milliseconds: 300), //to controll how long animation will play.
      lowerBound: 0,
      upperBound: 1,
      /*
      {D. }
      throught this we in the end controll btw which value flutter will aniamte.
      therefore with animations, we in the end always animate btw two values.
      means: animation will start at 0 and after 300 sec will stop at 1.

       
      */
    );
    _animationController.forward(); //to start the aniamtion
    //we can use .repeat() also to start again the animation once done
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _selectcategories(BuildContext context, Category category) {
    //159
    // load the dummy meals data into the their respective category
    // category in the argument is the selected category by the user
    // and user can now click on it.
    // after clicking the
    // final filteredmeals = dummyMeals
    //     .where((meal) => meal.categories.contains(category.id))
    //     .toList();
    final filteredmeals = widget.availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    //158 aka 7

    //dummyMeals.where((meal) => );// 159 aka 8
    //final numbers = <int>[1, 2, 3, 5, 6, 7];
    // var result = numbers.where((x) => x < 5); // (1, 2, 3)
    // result = numbers.where((x) => x > 5); // (6, 7)
    // result = numbers.where((x) => x.isEven); // (2, 6)

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MealsScreen(
          title: category.title,
          meals: filteredmeals,
        ),
      ),
    );
  }

  @override
  // Widget build(BuildContext context) {
  Widget build(
    BuildContext context,
  ) {
    //1.1. using gridView instead of listview.
    // gridview also contain gridview.builder (to dynamically grow the grid) for possible performance optimization.
    // but we use gridview() only cuz the categories are limited.
    /*
    {E. } the animation is a the listenable object and _animationController is such a listenable object
    and animation controller tells animation when to call the builder function.
    hence this func, we pass through this builder, will be executed for every tick 
    of our animation.For eg. 60 time per second.

     */
    return AnimatedBuilder(
      animation: _animationController,
      child: GridView(
        padding: const EdgeInsets.all(24),
        //1.2. grid Delegate : Controls the layout of the grid.
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //1.3.1 tells the no of column in the grid
          crossAxisCount: 2,
          //1.3.2 affect sizing of grid view item
          childAspectRatio: 3 / 2,
          //1.3.3 x and y axis spacing
          crossAxisSpacing: 20, //x
          mainAxisSpacing: 20, //y
        ),

        children: [
          // 3.2 aka 154:  for loop getting category we created in dummy data
          // and using that dummy data to the wgd we create in category grid item.
          for (final category in availableCategories)
            CategoryGridItem(
              category: category,
              onSelectCategory: () {
                _selectcategories(context, category);
              },
            )
        ],
      ),
      //--- APPROACH 1
      /*
      builder: (context, child) => Padding(
        padding: EdgeInsets.only(top: 100 - _animationController.value * 100),
        //means initally value is 0 and after 300 ms value will be 1*100

        child: child,
      ),
      */
      //--- APPROACH 2
      builder: (context, child) => SlideTransition(
        position: Tween(
          begin: const Offset(0, 0.3),
          end: const Offset(0, 0), //want to get back to actual value
        ).animate(CurvedAnimation(
            parent: _animationController, curve: Curves.easeInOut )),
        child: child,
      ),
      //drive helps us to animate instead of 0 & 1 value to other value
    );
  }
}
