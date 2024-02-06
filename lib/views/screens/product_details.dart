// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:frist_app/models/cartModel.dart';

// class ProductDetailsScreen extends StatefulWidget {
//   final Product productName;
//   const ProductDetailsScreen({
//     Key? key,
//     required this.productName,
//   }) : super(key: key);

//   @override
//   State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
// }

// class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.productName.title ?? "--"),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {},
//         child: const Icon(Icons.add_shopping_cart),
//       ),
//       body: ListView(
//         children: [
//           CarouselSlider(
//             options: CarouselOptions(),
//             items: [
//               // Here you need to provide a list of widgets for carousel items
//               // Example of an image widget:
//               Image.network(widget.productName.image), // Adjust according to your Product model
//               // Add more widgets for other images if needed
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               Chip(label: Text("Brand: ${widget.productName.brand}")),
//               Chip(label: Text("In stock: ${widget.productName.stock}")),
//             ],
//           ),
//           Chip(label: Text("Category: ${widget.productName.category}")),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               "Price: ${widget.productName.price}",
//               style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               children: [
//                 Text("${widget.productName.rating}"), // Assuming this is the rating property
//                 const Icon(Icons.star),
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(widget.productName. ?? "--"),
//           ),
//         ],
//       ),
//     );
//   }
// }
