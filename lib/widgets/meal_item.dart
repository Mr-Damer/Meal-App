import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

Widget mealItem(Meal meal, Function() onMealTap) {
  return Card(
    margin: const EdgeInsets.all(8),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    clipBehavior: Clip.hardEdge,
    elevation: 2,
    child: InkWell(
      onTap: onMealTap,
      child: Stack(
        children: [
          Hero(
            tag: meal.id,
            child: FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
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
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        mealItemTrait(Icons.schedule, "${meal.duration} min"),
                        const SizedBox(
                          width: 12,
                        ),
                        mealItemTrait(Icons.work, complexityText(meal)),
                        const SizedBox(
                          width: 12,
                        ),
                        mealItemTrait(
                            Icons.attach_money, affordabilityText(meal))
                      ],
                    )
                  ],
                ),
              ))
        ],
      ),
    ),
  );
}

String complexityText(Meal meal) {
  return meal.complexity.name[0].toUpperCase() +
      meal.complexity.name.substring(1);
}

String affordabilityText(Meal meal) {
  return meal.affordability.name[0].toUpperCase() +
      meal.affordability.name.substring(1);
}