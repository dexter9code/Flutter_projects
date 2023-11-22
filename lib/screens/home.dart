import 'package:flutter/material.dart';
import 'package:toon/data/dummy_cat.dart';
import 'package:toon/data/dummy_meals.dart';
import 'package:toon/data/popular_cat.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              height: 100,
              child: Image.asset(
                'assets/logo_black.png',
                fit: BoxFit.cover,
              ),
            ),
            const Text(
              'Categories',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 12,
            ),
            SizedBox(
              height: 38,
              child: ListView.builder(
                  itemCount: dummyCategories.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, index) {
                    return Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        padding:
                            EdgeInsets.symmetric(vertical: 7, horizontal: 15),
                        child: Text(
                          dummyCategories[index].title,
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    );
                  }),
            ),
            const SizedBox(
              height: 40,
            ),
            const Row(
              children: [
                Text(
                  'Popular Items',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Text(
                    'View All',
                    style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                        decorationStyle: TextDecorationStyle.dashed,
                        decorationColor: Colors.white),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 230,
              child: ListView.builder(
                  itemCount: dummyMeals.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Container(
                        // height: double.infinity,
                        // constraints: BoxConstraints(minHeight: 180),
                        width: 180,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                topLeft: Radius.circular(10))),
                        child: Column(
                          children: [
                            Container(
                              constraints: BoxConstraints(
                                  minHeight: 180, maxHeight: 200),
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  topLeft: Radius.circular(10),
                                ),
                                child: Image.network(
                                  dummyMeals[index].imgUrl,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              dummyMeals[index].title,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Popular Recipes',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 40,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: dummyPopularCat.length,
                  itemBuilder: (ctx, index) {
                    return Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          dummyPopularCat[index].title,
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    );
                  }),
            ),
            const SizedBox(
              height: 25,
            ),
            const Text(
              'Kitchen: Robins',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            const SizedBox(
              height: 4,
            ),
            const Text(
              'Robins kitchen',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
