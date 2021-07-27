import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:my_recipe_collections/homepage/home_listtile.dart';
import 'package:my_recipe_collections/homepage/recipe_data.dart';

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

    List<RecipeData> items = List<RecipeData>
        .generate(20, (i) =>
        RecipeData("title ${i}", "subtitle ${i}", "assets/background.jpg"));

    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        if (index == 0) {
          return home_listtile(items[index]);
        }else{
          return _listTile(context, items[index]);
        }
      },
    );
  }

  Widget _listTile(BuildContext context, RecipeData item) {
    return ListTile(
        leading: imageBox("assets/background.jpg"),
        title: Text(item.title),
        subtitle: Text(item.subtitle),
        onTap: () {
          SnackBar snackBar = SnackBar(
            content: Text(item.title + " clicked"),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        });
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
