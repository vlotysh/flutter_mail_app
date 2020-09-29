import 'package:flutter/material.dart';

import '../data/dummy_data.dart';
import '../models/Meal.dart';

class MealDetail extends StatelessWidget {
  static const ROUTE_NAME = '/meal-detail';

  final Function isFavorite;
  final Function toggleFavorite;

  MealDetail(this.isFavorite, this.toggleFavorite);

  Widget buildSectionTitle(String text, context) {
    return Container(
      child: Text(
        text,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
        ),
        height: 150,
        width: double.infinity,
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.all(10),
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, String> arguments =
        ModalRoute.of(context).settings.arguments;

    final Meal meal =
        DUMMY_MEALS.firstWhere((element) => element.id == arguments['id']);

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(meal.imageUrl,
                  alignment: Alignment.center, fit: BoxFit.cover),
            ),
            buildSectionTitle('Ingredients', context),
            buildContainer(ListView.builder(
                itemCount: meal.ingredients.length,
                itemBuilder: (ctx, index) => Card(
                      color: Theme.of(context).accentColor,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Text(meal.ingredients[index]),
                      ),
                    ))),
            buildSectionTitle('Steps', context),
            buildContainer(ListView.builder(
                itemCount: meal.steps.length,
                itemBuilder: (ctx, index) => Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            child: Text('# ${index + 1}'),
                          ),
                          title: Text(meal.steps[index]),
                        ),
                        Divider()
                      ],
                    ))),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(isFavorite(meal) ? Icons.star : Icons.star_border),
        foregroundColor: Theme.of(context).accentColor,
        onPressed: () => toggleFavorite(meal),
      ),
    );
  }
}
