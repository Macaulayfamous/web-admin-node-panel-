import 'dart:convert';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:http/http.dart' as http;
import 'package:web_admin_front_end/models/subcategory_model.dart';

import '../global_variable.dart';
import '../services/mannage_http_response.dart';

class SubCategoryController {
  uploadSubCategory({
    required String categoryId,
    required String categoryName,
    required dynamic pickedImage,
    required String subCategoryName,
    required context,
  }) async {
    try {
      final cloudinary = CloudinaryPublic('di79ormkb', 'i8kswhed');

      // upload image
      CloudinaryResponse imageResponse = await cloudinary.uploadFile(
          CloudinaryFile.fromBytesData(pickedImage,
              identifier: 'pickedImage', folder: 'SubCategoryImages'));

      String image = imageResponse.secureUrl;

      SubCategoryModel subCategory = SubCategoryModel(
        id: '',
        categoryId: categoryId,
        categoryName: categoryName,
        image: image,
        subCategoryName: subCategoryName,
      );

      http.Response response = await http.post(
        Uri.parse('$uri/api/subcategories'),
        body: subCategory.toJson(),
        headers: <String, String>{
          "Content-Type": 'application/json; charset=UTF-8',
        },
      );

      manageHttpResponse(
          response: response,
          context: context,
          onSuccess: () {
            showSnackber(context, 'SubCategory upload successful');
          });
    } catch (e) {
      print('Error uploading in Cloudinary: $e');
    }
  }

  // get all subcategory

  Future<List<SubCategoryModel>> loadSubCategories() async {
    try {
      http.Response response = await http.get(
        Uri.parse('$uri/api/subcategories'),
        headers: <String, String>{
          "Content-Type": 'application/json; charset=UTF-8',
        },
      );

      print(response.body);

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);

        List<SubCategoryModel> subCategories = data
            .map((subcategory) => SubCategoryModel.fromJson(subcategory))
            .toList();

        return subCategories;
      } else {
        throw Exception('failed to upload Subcategory');
      }
    } catch (e) {
      throw Exception('error loading Subcategory: $e');
    }
  }
}
