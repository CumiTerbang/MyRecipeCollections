import 'package:flutter/material.dart';
import 'package:my_recipe_collections/data/recipe_data.dart';

class home_item_listtile extends StatelessWidget {
  final RecipeData item;
  final VoidCallback onOpenDetailPage;

  home_item_listtile(this.item, this.onOpenDetailPage);

  Widget _verticalTile(BuildContext context, RecipeData item) {
    return InkWell(
      onTap: onOpenDetailPage,
      child: Container(
        padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 15.0),
        // margin: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _thumbnail(item),
            _title(item.title,
                TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
            _title(item.subtitle, TextStyle(fontSize: 14.0))
          ],
        ),
      ),
    );
  }

  Widget _thumbnail(RecipeData item) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Container(
          child: Image.asset(
        item.imageurl,
        fit: BoxFit.cover,
      )),
    );
  }

  Widget _title(String text, TextStyle style) {
    return Container(
      padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
      child: Text(
        text,
        style: style,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _verticalTile(context, item);
  }
}
