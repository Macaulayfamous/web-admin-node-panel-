import 'dart:convert';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:http/http.dart' as http;
import 'package:web_admin_front_end/services/mannage_http_response.dart';

import '../global_variable.dart';
import '../models/category_model.dart';

class CategoryController {
  uploadCategory({
    required dynamic pickedImage,
    required dynamic pickedBanner,
    required String name,
    required context,
  }) async {
    try {
      final cloudinary = CloudinaryPublic('di79ormkb', 'i8kswhed');

      // upload image
      CloudinaryResponse imageResponse = await cloudinary.uploadFile(
          CloudinaryFile.fromBytesData(pickedImage,
              identifier: 'pickedImage', folder: 'categoryImages'));

      String image = imageResponse.secureUrl;

      // upload banner
      CloudinaryResponse bannerResponse = await cloudinary.uploadFile(
          CloudinaryFile.fromBytesData(pickedBanner,
              identifier: 'pickedBanner', folder: 'categoryImages'));

      String banner = bannerResponse.secureUrl;

      CategoryModel category = CategoryModel(
        id: '',
        name: name,
        image: image,
        banner: banner,
      );

      http.Response response = await http.post(
        Uri.parse('$uri/api/categories'),
        body: category.toJson(),
        headers: <String, String>{
          "Content-Type": 'application/json; charset=UTF-8',
        },
      );

      manageHttpResponse(
          response: response,
          context: context,
          onSuccess: () {
            showSnackber(context, 'Category upload successful');
          });
    } catch (e) {
      print('Error uploading in Cloudinary: $e');
    }
  }

  // get all category

  Future<List<CategoryModel>> loadCategories() async {
    try {
      http.Response response = await http.get(
        Uri.parse('$uri/api/categories'),
        headers: <String, String>{
          "Content-Type": 'application/json; charset=UTF-8',
        },
      );

      print(response.body);

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);

        List<CategoryModel> categories =
            data.map((categori) => CategoryModel.fromJson(categori)).toList();

        return categories;
      } else {
        throw Exception('failed to upload category');
      }
    } catch (e) {
      throw Exception('error loading category: $e');
    }
  }
}
