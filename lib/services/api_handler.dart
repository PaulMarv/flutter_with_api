import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:store_api_flutter_course/consts/api_consts.dart';
import 'package:store_api_flutter_course/models/categories_model.dart';
import 'package:store_api_flutter_course/models/products_model.dart';
import 'package:store_api_flutter_course/models/users_model.dart';

class APIHandler {
  static Future<List<dynamic>> getData({required String target}) async {
    try {
      var uri = Uri.https(BASE_URL, 'api/v1/$target');
      var response = await http.get(uri);

      var data = jsonDecode(response.body);
      List tempList = [];
      if (response.statusCode != 200) {
        throw data['message'];
      }

      for (var v in data) {
        tempList.add(v);
      }
      return tempList;
    } catch (error) {
      print(error);
      throw error.toString();
    }
  }

  static Future<List<ProductsModel>> getAllProducts() async {
    List temp = await getData(target: 'products');
    return ProductsModel.productsFromSnapshot(temp);
  }

  static Future<List<CategoriesModel>> getAllCategrories() async {
    List temp = await getData(target: 'categories');
    return CategoriesModel.categoriesFromSnapshot(temp);
  }

  static Future<List<UsersModel>> getAllUsers() async {
    List temp = await getData(target: 'users');
    return UsersModel.usersFromSnapshot(temp);
  }

  static Future<ProductsModel> getProductById({required String id}) async {
    try {
      var uri = Uri.https(BASE_URL, 'api/v1/products/$id');
      var response = await http.get(uri);

      var data = jsonDecode(response.body);
       if (response.statusCode != 200) {
        throw data['message'];
      }
      return ProductsModel.fromJson(data);
    } catch (e) {
      throw e.toString();
    }
  }
}
