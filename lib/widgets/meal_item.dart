import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({
    super.key,
    required this.meal,
    required this.onSelectMeal,
  });
  final Meal meal;
  final void Function(Meal meal) onSelectMeal;

  /*
  therefore complexity.simple is an enum :
  simple getter fucntion to convert
  ugly looking complexity.simple (dummy meal data)
  to Simple 
  */
  String get complexityText {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get affordabilityText {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      //addded margin accross picture
      margin: const EdgeInsets.all(8),
      //added shape with border radius 8
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      /*
      Stack ignore the shapes that we setup in the card and go out of the card widget.
      to inforce we use clipBehavior: Clip.hardEdge,
      it cuttoff the extra shape going out of the card widget.
      */
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap: () {
          onSelectMeal(meal);
        },
        //stack the  widget on top of each other
        child: Stack(
          children: [
            Hero(
              tag: meal.id,
            /*
            -FadeInImage: Creates a widget that displays a [placeholder] while an [image] is 
             loading, then fades-out the placeholder and fades-in the image.)
            -MemoryImage: Creates an object that decodes a [Uint8List] buffer as an image.
            -kTransparentImage: A simple transparent image. Represented as a Uint8List, which was originally extracted from the Flutter codebase (was private in the test package).
            -NetworkImage: access the online image:

            */
            
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(meal.imageUrl),
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
              ),
            ),
            //Positioned : Creates a widget that controls where a child of a [Stack] is positioned.
            Positioned(
              right: 0,
              left: 0,
              bottom: 0,
              child: Container(
                color: Colors.black54,
                padding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow
                          .ellipsis, // very long text cuttoff by 3 dot ...
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    /*
                    normally row inside a row gives error and in this case we must use expanded
                    but here this row is under column under position widget
                    which left and right is set to zero.

                    */
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MealItemTrait(
                            icon: Icons.schedule,
                            label: ' ${meal.duration} min'),
                        const SizedBox(
                          width: 12,
                        ),
                        MealItemTrait(
                          icon: Icons.work,
                          label: ' $complexityText',
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        MealItemTrait(
                          icon: Icons.attach_money,
                          label: ' $affordabilityText',
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
