import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:frist_app/core/firebase_cloud_util.dart';

class categoriesPage extends StatefulWidget {
  const categoriesPage({super.key});

  @override
  State<categoriesPage> createState() => _categoriesPageState();
}

class _categoriesPageState extends State<categoriesPage> {
  final Stream<QuerySnapshot> categoriesStream = FirebaseFirestore.instance
      .collection(FirebaseCloudStoreUtil.categoryCollectionName)
      .snapshots();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: categoriesStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong , ${snapshot.error.toString()}');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (BuildContext context, int index) {
            Map<String, dynamic> data =
                snapshot.data!.docs[index].data()! as Map<String, dynamic>;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.blue,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 30,
                      height: 30,
                      child: Image.network(data["photo_url"]),
                    ),
                    Text(
                      data["name"],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "item no: ${data['item_no']}",
                      textAlign: TextAlign.center,
                    ),
                    IconButton(
                        onPressed: () async {
                          await FirebaseCloudStoreUtil.deleteCategory(
                              snapshot.data!.docs[index].id);
                        },
                        icon: Icon(Icons.delete))
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
  

//   Widget build(BuildContext context) {
//     return GridView.builder(
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 3,
//       ),
//       itemCount: 5,
//       itemBuilder: (BuildContext context, int index) {
//         return Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Container(
//             color: Colors.lightBlue,
//             child: Icon(Icons.search),
//           ),
//         );
//       },
//     );
//   }
// }
