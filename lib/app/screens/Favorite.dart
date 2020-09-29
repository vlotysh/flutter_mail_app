import 'package:flutter/material.dart';
import 'package:meals_app/app/models/Meal.dart';
import 'package:meals_app/app/widgets/MealItem.dart';

class Favorite extends StatelessWidget {
  final List<Meal> favoriteMeals;
  final Function toggleFavorite;

  Favorite({this.favoriteMeals, this.toggleFavorite});

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Container(child: Center(child: Text('No Favorite')));
    }

    return ListView.builder(
      itemBuilder: (ctx, index) {
        return Column(
          children: [
            MealItem(meal: favoriteMeals[index], removeItem: () {}),
            Container(
              child: GestureDetector(
                  child: Row(children: [
                    Text('Remove from favorite'),
                    Icon(Icons.delete)
                  ]),
                  onTap: () => toggleFavorite(favoriteMeals[index])),
            ),
          ],
        );
      },
      itemCount: favoriteMeals.length,
    );
  }
}
