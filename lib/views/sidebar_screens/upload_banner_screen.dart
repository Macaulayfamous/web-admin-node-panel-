import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:web_admin_front_end/controllers/banner_controller.dart';
import 'package:web_admin_front_end/views/sidebar_screens/widgets/banner_widget.dart';

class UploadBannerScreen extends StatefulWidget {
  static const String id = '\bannerscreen';
  const UploadBannerScreen({super.key});

  @override
  State<UploadBannerScreen> createState() => _UploadBannerScreenState();
}

class _UploadBannerScreenState extends State<UploadBannerScreen> {
  final BannerController _bannerController = BannerController();
  dynamic _image;

  pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );

    if (result != null) {
      setState(() {
        _image = result.files.first.bytes;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              alignment: Alignment.topLeft,
              child: const Text(
                'Banner',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              )),
        ),
        const Divider(
          // thickness: 2,
          color: Colors.grey,
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: _image != null
                      ? Image.memory(_image)
                      : const Text('Category Image'),
                ),
              ),
            ),
            const SizedBox(width: 10),
            OutlinedButton(onPressed: () {}, child: const Text('Cancel')),
            const SizedBox(width: 10),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                onPressed: () async {
                  await _bannerController.uploadBanner(
                      pickedImage: _image, context: context);
                },
                child: const Text(
                  'Save',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ))
          ],
        ),
        Padding(
          padding:
              const EdgeInsets.only(top: 8.0, left: 22, bottom: 8, right: 18),
          child: ElevatedButton(
              onPressed: () {
                pickImage();
              },
              child: const Text('Pick Image')),
        ),
        const Divider(
          color: Colors.grey,
        ),
        const BannerWidget(),
      ],
    );
  }
}
