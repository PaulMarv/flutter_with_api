import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:store_api_flutter_course/consts/api_consts.dart';
import 'package:store_api_flutter_course/models/products_model.dart';

class APIHandler {
  static Future<List<ProductsModel>> getAllProducts() async {
    var uri = Uri.https(BASE_URL, 'api/v1/products');
    var response =
        // await http.get(Uri.parse('https://api.escuelajs.co/api/v1/products'));
        await http.get(uri);
    // print("response ${jsonDecode(response.body)}");
    var data = jsonDecode(response.body);
    List tempList = [];

    for (var v in data) {
      tempList.add(v);
      // print("V $v \n\n");
    }
    return ProductsModel.productsFromSnapshot(tempList);
  }
}
