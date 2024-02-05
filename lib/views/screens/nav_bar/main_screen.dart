import 'package:flutter/material.dart';
import 'package:frist_app/models/products_model.dart';
import 'package:frist_app/views/screens/product_details.dart';
import 'package:frist_app/service/products_service.dart';
import 'package:frist_app/views/widgets/item_card.dart';

import 'package:flutter/material.dart';
import 'package:frist_app/models/products_model.dart';
import 'package:frist_app/views/screens/product_details.dart';
import 'package:frist_app/service/products_service.dart';
import 'package:frist_app/views/widgets/item_card.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool isLoading = true;
  List<Product> productList = [];

  Future<void> getData() async {
    productList = await ProductsService.getProductsData();
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            itemCount: productList.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductDetailsScreen(
                                productName: productList[index],
                              )),
                    );
                  },
                  child: itemCard(
                    productName: productList[index].title ?? "--",
                    price: "${productList[index].price}",
                    thumbnail: productList[index].thumbnail ?? "",
                  ));
            },
          );
  }
}
