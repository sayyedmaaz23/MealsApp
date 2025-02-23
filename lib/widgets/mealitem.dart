import 'package:flutter/material.dart';
import 'mealtriats.dart';
import 'package:meals/model/meal.dart';
import 'package:transparent_image/transparent_image.dart';

class Mealitem extends StatelessWidget {
  String capsformat(String msg) {
    final new_msg = msg.split('.')[1];
    return new_msg[0].toUpperCase() + new_msg.substring(1);
  }

  const Mealitem({super.key, required this.meal});
  final Meal meal;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Hero(
          tag: meal.id,
          child: FadeInImage(
              fit: BoxFit.fitWidth,
              height: 200,
              width: double.infinity,
              repeat: ImageRepeat.noRepeat,
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl)),
        ),
        Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              color: Colors.black54,
              child: Column(
                children: [
                  Text(
                    meal.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 20,
                    children: [
                      Mealtriats(
                          icon: Icons.watch_later_outlined,
                          msg: '${meal.duration} min'),
                      Mealtriats(
                          icon: Icons.attach_money_outlined,
                          msg: capsformat(meal.affordability.toString())),
                      Mealtriats(
                          icon: Icons.work_outline_outlined,
                          msg: capsformat(meal.complexity.toString()))
                    ],
                  ),
                ],
              ),
            )),
      ],
    );
  }
}
