import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';

//video 154 aka 3.1
class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem(
      {super.key, required this.category, required this.onSelectCategory});
  final Category category;
  final void Function() onSelectCategory;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      //155 aka 4
      onTap: onSelectCategory, //155 aka 4
      splashColor: Theme.of(context).primaryColor, //155 aka 4
      borderRadius: BorderRadius.circular(16), //155 aka 4
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), //155 aka 4
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.55),
              category.color.withOpacity(0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.background,
              ),
        ),
      ),
    );
  }
}
