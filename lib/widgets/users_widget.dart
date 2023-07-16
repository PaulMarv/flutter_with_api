import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:store_api_flutter_course/consts/global_colors.dart';

class UserWidget extends StatelessWidget {
  const UserWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListTile(
      leading: FancyShimmerImage(
        height: size.width * 0.15,
        width: size.width * 0.15,
        errorWidget: const Icon(
          IconlyBold.danger,
          color: Colors.red,
          size: 28,
        ),
        imageUrl: "https://www.akoynbeauty.com/cdn/shop/articles/Rege-Jean_Page_1024x1024.png?v=1612108345",
        boxFit: BoxFit.fill,
      ),
      title: const Text(
        "User Name"
      ),
      subtitle: const Text("Email@email.com") ,
      trailing: Text(
        'User role',
        style: TextStyle (
          color: lightIconsColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
