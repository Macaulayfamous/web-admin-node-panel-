import 'package:flutter/material.dart';

import '../../../controllers/subcategory_controller.dart';
import '../../../models/subcategory_model.dart';

class SubcategoryWidget extends StatefulWidget {
  const SubcategoryWidget({super.key});

  @override
  State<SubcategoryWidget> createState() => _SubcategoryWidgetState();
}

class _SubcategoryWidgetState extends State<SubcategoryWidget> {
  late Future<List<SubCategoryModel>> futureSubCategories;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureSubCategories = SubCategoryController().loadSubCategories();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: futureSubCategories,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text('error: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text('No Subcategory'),
            );
          } else {
            final subCategories = snapshot.data!;
            return SizedBox(
              height: 400,
              child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: subCategories.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    crossAxisCount: 6,
                  ),
                  itemBuilder: (context, index) {
                    final subCategory = subCategories[index];

                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            height: 100,
                            width: 100,
                            subCategory.image,
                          ),
                          Text("Parent: ${subCategory.categoryName}"),
                          Text("Sub: ${subCategory.subCategoryName}"),
                        ],
                      ),
                    );
                  }),
            );
          }
        });
  }
}
