import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:web_admin_front_end/models/order_model.dart';

import '../global_variable.dart';

class OrderController {
  // load orders
  Future<List<OrderModel>> fetchOrders() async {
    try {
      http.Response response = await http.get(
        Uri.parse('$uri/api/orders'),
        headers: <String, String>{
          "Content-Type": 'application/json; charset=UTF-8',
        },
      );

      print(response.body);

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        List<OrderModel> orders =
            data.map((order) => OrderModel.fromJson(order)).toList();
        return orders;
      } else {
        throw Exception('Failed to load orders');
      }
    } catch (e) {
      throw Exception('Error loading orders:$e');
    }
  }
}
