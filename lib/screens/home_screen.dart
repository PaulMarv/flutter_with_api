import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:page_transition/page_transition.dart';
import 'package:store_api_flutter_course/consts/global_colors.dart';
import 'package:store_api_flutter_course/screens/categories_screen.dart';
import 'package:store_api_flutter_course/screens/feeds_sceen.dart';
import 'package:store_api_flutter_course/screens/users_screen.dart';
import 'package:store_api_flutter_course/widgets/appbar_icons.dart';
import 'package:store_api_flutter_course/widgets/category_widget.dart';
import 'package:store_api_flutter_course/widgets/feeds_widget.dart';
import 'package:store_api_flutter_course/widgets/sale_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController _textEditingController;
  @override
  void initState() {
    _textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Home'),
            leading: AppBarIcons(
              function: () {
                Navigator.push(
                  context,
                  PageTransition(
                      child: const CategoriesScreen(),
                      type: PageTransitionType.fade),
                );
              },
              icon: IconlyBold.category,
            ),
            actions: [
              AppBarIcons(
                  function: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            child: const UsersScreen(),
                            type: PageTransitionType.fade));
                  },
                  icon: IconlyBold.user_3),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(height: 18),
                TextField(
                  controller: _textEditingController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'Search',
                    filled: true,
                    fillColor: Theme.of(context).cardColor,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: Theme.of(context).cardColor)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          width: 1,
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                    suffixIcon: Icon(
                      IconlyLight.search,
                      color: lightIconsColor,
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: size.height * 0.25,
                          child: Swiper(
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return const SaleWidget();
                            },
                            autoplay: true,
                            pagination: const SwiperPagination(
                              alignment: Alignment.bottomCenter,
                              builder: DotSwiperPaginationBuilder(
                                color: Colors.white,
                                activeColor: Colors.red,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              const Text(
                                "Latest Products",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                ),
                              ),
                              const Spacer(),
                              AppBarIcons(
                                  function: () {
                                    Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.fade,
                                        child: const FeedsScreen(),
                                      ),
                                    );
                                  },
                                  icon: IconlyBold.arrow_right_2),
                            ],
                          ),
                        ),
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 3,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 0.0,
                                  mainAxisSpacing: 0.0,
                                  childAspectRatio: 0.7),
                          itemBuilder: (context, index) {
                            return const Feedwidget();
                          },
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
