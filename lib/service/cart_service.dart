import 'package:dio/dio.dart';
import 'package:frist_app/models/CartModel.dart';

class CartService {
  static final dio = Dio();

  static Future<List<Product>> getCartData() async {
    final response =
        await dio.getUri(Uri.parse("https://dummyjson.com/carts/1"));
    var data = response.data;
    UserModel userModel = UserModel.fromJson(data);
    return userModel.products ?? [];
  }
}

List<Product> UserData = [];
