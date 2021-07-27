import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_recipe_collections/about_page.dart';
import 'package:my_recipe_collections/home_page.dart';

class TitleScreenPage extends StatelessWidget {
  Container imageBox(String imgsrc) {
    return Container(
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
            shape: BoxShape.rectangle,
            image: new DecorationImage(
                fit: BoxFit.fill, image: new AssetImage(imgsrc))));
  }

  ConstrainedBox buildButtonNextPage(
      BuildContext context, String label, Widget targetPage) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(width: 200),
      child: ElevatedButton(
          child: Text(label),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => targetPage),
            );
          }),
    );
  }

  ConstrainedBox buildButtonNewPage(
      BuildContext context, String label, Widget targetPage) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(width: 200),
      child: ElevatedButton(
          child: Text(label),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => targetPage),
            );
          }),
    );
  }

  Widget buildWhiteScreen() {
    return Column(
      children: [
        Expanded(
          child: Container(color: Color(0x90FFFFFF)),
        ),
      ],
    );
  }

  Widget buildBodyContent(BuildContext context) {
    return Stack(children: [
      Positioned.fill(
        //
        child: Image(
          image: AssetImage('assets/background.jpg'),
          fit: BoxFit.fitHeight,
        ),
      ),
      buildWhiteScreen(),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          imageBox("assets/my_logo.png"),
          Divider(
            height: 30.0,
          ),
          buildButtonNewPage(context, "Get Started", HomePage()),
          buildButtonNextPage(context, "About", AboutPage()),
        ],
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DoubleBackToCloseApp(
        snackBar: const SnackBar(
          content: Text('Tap back again to leave'),
        ),
        child: buildBodyContent(context),
      ),
    );
  }
}
