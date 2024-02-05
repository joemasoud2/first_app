import 'package:flutter/material.dart';

class categoriesPage extends StatefulWidget {
  const categoriesPage({super.key});

  @override
  State<categoriesPage> createState() => _categoriesPageState();
}

class _categoriesPageState extends State<categoriesPage> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: Colors.lightBlue,
            child: Icon(Icons.search),
          ),
        );
      },
    );
  }
}
