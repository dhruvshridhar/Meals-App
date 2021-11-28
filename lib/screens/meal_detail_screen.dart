import 'package:flutter/material.dart';
import '../data/dummy_data.dart';

class MealDetailsScreen extends StatelessWidget {
  static const routeName = '/meal-details';

  Widget _buildSectionTitle(BuildContext ctx, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(ctx).textTheme.headline6,
      ),
    );
  }

  Widget _buildContainer(BuildContext ctx, List<String> list) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 200,
      width: 300,
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (ctx, index) => Card(
          color: Theme.of(ctx).accentColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Text(list[index]),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealsArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final mealData =
        DUMMY_MEALS.firstWhere((meal) => meal.id == mealsArgs['id']);
    return Scaffold(
      appBar: AppBar(
        title: Text(mealData.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                mealData.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            _buildSectionTitle(context, 'Ingredients'),
            _buildContainer(context, mealData.ingredients),
            _buildSectionTitle(context, 'Steps'),
            _buildContainer(context, mealData.steps),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pop(mealsArgs['id']);
          },
          child: Icon(Icons.delete)),
    );
  }
}
