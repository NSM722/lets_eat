import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:lets_eat/models/meal.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({
    super.key,
    required this.meal,
  });

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.amberAccent,
      shadowColor: Colors.lightGreen,
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(9),
      ),
      //enforce the shape of the border radius
      clipBehavior: Clip.hardEdge,
      elevation: 2, // drop shadow effect
      child: InkWell(
        onTap: () {},
        child: Stack(
          children: [
            // the bottom most widget
            FadeInImage(
              fit: BoxFit.cover,
              height: 220,
              width: double.infinity,
              placeholder: MemoryImage(
                // placeholder image
                kTransparentImage,
              ),
              image: NetworkImage(
                // fetched from the internet
                meal.imageUrl,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black54,
                padding: const EdgeInsets.symmetric(
                  vertical: 7,
                  horizontal: 42,
                ),
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: Colors.white70),
                    ),
                    const SizedBox(height: 12),
                    const Row(
                      children: [],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
