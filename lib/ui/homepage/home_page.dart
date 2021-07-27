import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:my_recipe_collections/ui/detailpage/detail_page.dart';
import 'package:my_recipe_collections/ui/titlescreenpage/about_page.dart';
import 'package:my_recipe_collections/ui/homepage/home_headline_listtile.dart';
import 'package:my_recipe_collections/data/recipe_data.dart';

import 'home_item_listtile.dart';

class HomePage extends StatelessWidget {
  ConstrainedBox buildButtonComingSoon(
      BuildContext context, String label, String msg) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(width: 200),
      child: ElevatedButton(
          child: Text(label),
          onPressed: () {
            SnackBar snackBar = SnackBar(
              content: Text(msg),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }),
    );
  }

  Container imageBox(String imgsrc) {
    return Container(
        width: 60.0,
        height: 60.0,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            image:
                DecorationImage(fit: BoxFit.cover, image: AssetImage(imgsrc))));
  }

  Widget buildBodyContent(BuildContext context) {
    List<RecipeData> items = List<RecipeData>.generate(
        20,
        (i) =>
            RecipeData("title ${i}", "subtitle ${i}", "assets/background.jpg"));

    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        if (index == 0) {
          return home_headline_listtile(items[index], () {
            openDetailPage(context, items[index]);
          });
        } else {
          return home_item_listtile(items[index], () {
            openDetailPage(context, items[index]);
          });
        }
      },
    );
  }

  void openDetailPage(BuildContext context, RecipeData item) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => DetailPage(item: item)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: DoubleBackToCloseApp(
        snackBar: const SnackBar(
          content: Text('Tap back again to leave'),
        ),
        child: buildBodyContent(context),
      ),
    );
  }
}
