import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:store_api_flutter_course/consts/global_colors.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: FancyShimmerImage(
              height: size.height * 0.45,
              width: size.height * 0.45,
              errorWidget: const Icon(
                IconlyBold.danger,
                color: Colors.red,
                size: 28,
              ),
              imageUrl: "https://cdn.thewirecutter.com/wp-content/media/2021/02/whitesneakers-2048px-4187.jpg",
              boxFit: BoxFit.fill,
            ),
          ),
          Align(
            child: Text(
              'Cat Name', 
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              backgroundColor: lightCardColor.withOpacity(0.8)
            ),
            ),
          )
        ],
      ),
    );
  }
}
