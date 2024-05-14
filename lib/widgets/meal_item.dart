import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';
//* This file will be used to create the meal item widget that will be used to display the meal items in the meal screen , This'll contain the  image and the text of the meal 
class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal});
  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Card( margin:const EdgeInsets.all(8) ,shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)), clipBehavior: Clip.hardEdge,elevation: 2,
        child: InkWell(
      onTap: () {},
      child: Stack(
        //? This is the stack widget that will be used to stack the image and the text on top of each other
        children: [
          FadeInImage( //# This Fade in Image will give the fade in image animation before the image loads 
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),fit: BoxFit.cover,height: 200,width: double.infinity,),
          Positioned(
            child:Container(
              color: Colors.black54,
              padding: EdgeInsets.symmetric(vertical: 6, horizontal: 44),
              child: Column(
                children: [
                  Text(
                    meal.title,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,//?Using TextOverflow.elliptis will make sure that the text will be cut off if it exceeds the limit using ... at the end
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row( //* We have a row inside another Row and it's not  giving error Because of postioned argument 
                    children: [MealItemTrait(icon: Icons.schedule, label: '${meal.duration} min ')],
                  )
                ],
              ),
            ), 
            bottom: 0,
            left: 0,
            right: 0,
          )
        ],
      ),
    ));
  }
}
