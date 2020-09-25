import 'package:flutter/material.dart';

import '../models/Meal.dart';
import '../screens/MealDetail.dart';
import 'MealIconInfo.dart';

class MealItem extends StatelessWidget {
  final Meal meal;

  MealItem({this.meal});

  String get complexityText {
    switch (meal.complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'Unknow';
    }
  }

  String get affordabilityText {
    switch (meal.affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      case Affordability.Luxurious:
        return 'Luxurious';
        break;
      default:
        return 'Unknow';
    }
  }

  void selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context)
        .pushNamed(MealDetail.ROUTE_NAME, arguments: {'id': meal.id});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context, meal),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    meal.imageUrl,
                    width: double.infinity,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                    bottom: 20.0,
                    right: 10.0,
                    child: Container(
                      color: Colors.black54,
                      width: 250,
                      padding: EdgeInsets.all(10),
                      child: Text(
                        meal.title,
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MealIconInfo(
                      icon: Icons.schedule, info: '${meal.duration} min'),
                  MealIconInfo(icon: Icons.work, info: complexityText),
                  MealIconInfo(
                      icon: Icons.attach_money, info: affordabilityText),
                ],
              ),
            )
          ],
        ),
      ),
    );
    /*return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(child: Text(meal.title)),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: meal.ingredients.map((step) => Text(step)).toList())
          ],
        )
      ],
    ); */
  }
}
