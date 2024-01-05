import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/category.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/category_grid_item.dart';

//Section 9: To make an explicit animation convert this stateless to statefull widget
class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen(
      {super.key,
       //required this.onToggleFavourite, ** NO NEED CUZ OF PROVIDER
      required this.availableMeals});
  //final void Function(Meal meal) onToggleFavourite;  ** NO NEED CUZ OF PROVIDER
  final List<Meal> availableMeals;

  void _selectcategories(BuildContext context, Category category) {
    //159
    // load the dummy meals data into the their respective category
    // category in the argument is the selected category by the user
    // and user can now click on it.
    // after clicking the
    // final filteredmeals = dummyMeals
    //     .where((meal) => meal.categories.contains(category.id))
    //     .toList();
    final filteredmeals = availableMeals
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
  Widget build(BuildContext context,) {
    return Scaffold(
      //1.1. using gridView instead of listview.
      // gridview also contain gridview.builder (to dynamically grow the grid) for possible performance optimization.
      // but we use gridview() only cuz the categories are limited.

      body: GridView(
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
        // children: const [
        //   Text(
        //     '1',
        //     style: TextStyle(color: Colors.white),
        //   ),
        //   Text(
        //     '2',
        //     style: TextStyle(color: Colors.white),
        //   ),
        //   Text(
        //     '3',
        //     style: TextStyle(color: Colors.white),
        //   ),
        //   Text(
        //     '4',
        //     style: TextStyle(color: Colors.white),
        //   ),
        //   Text(
        //     '5',
        //     style: TextStyle(color: Colors.white),
        //   ),
        //   Text(
        //     '6',
        //     style: TextStyle(color: Colors.white),
        //   ),
        // ],

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
    );
  }
}
