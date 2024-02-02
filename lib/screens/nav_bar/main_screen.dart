import 'package:flutter/material.dart';
import 'package:frist_app/widgets/item_card.dart';

class mainPage extends StatefulWidget {
  const mainPage({super.key});

  @override
  State<mainPage> createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  List<String> productNames = ["Mouse", "Keyboard"];
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: productNames.length,
      itemBuilder: (BuildContext context, int index) {
        return itemCard(prouductName: productNames[index]);
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider();
      },
    );
  }
}
