import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/category.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void _selectcategories(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MealsScreen(title: ' Some title', meals: []),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pick your category"),
      ),
      //1.1. using gridView instead of listview.
      // gridview also contain gridview.builder (to dynamically grow the grid) for possible performance optimization.
      // but we use gridview() only cuz the categories are limited.

      body: GridView(
        padding: EdgeInsets.all(24),
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
                _selectcategories(context);
              },
            )
        ],
      ),
    );
  }
}
