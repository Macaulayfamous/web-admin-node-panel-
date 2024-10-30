import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:web_admin_front_end/models/vendor_model.dart';

import '../global_variable.dart';

class VendorController {
  // load buyers
  Future<List<VendorModel>> fetchVendors() async {
    try {
      http.Response response = await http.get(
        Uri.parse('$uri/api/vendors'),
        headers: <String, String>{
          "Content-Type": 'application/json; charset=UTF-8',
        },
      );

      print(response.body);

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        List<VendorModel> vendors =
            data.map((vendor) => VendorModel.fromMap(vendor)).toList();
        return vendors;
      } else {
        throw Exception('Failed to load Vendors');
      }
    } catch (e) {
      throw Exception('Error loading Vendors:$e');
    }
  }
}
