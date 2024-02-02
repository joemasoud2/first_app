import 'package:flutter/material.dart';

class itemCard extends StatelessWidget {
  final String prouductName;
  const itemCard({super.key, required this.prouductName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.blueGrey, borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.shopify_sharp),
            Text(prouductName),
            Text("500\$"),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
            )
          ],
        ),
      ),
    );
  }
}
