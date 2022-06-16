import 'dart:io';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:image_items_identification/widgets/app_txt_btn.dart';
import 'package:image_items_identification/constants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_items_identification/functions.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? pickedImageFile;
  final picker = ImagePicker();
  bool isThereImage = false;

  // Show Bottomsheet to select image from camera or gallery
  void showBottomSheet(BuildContext context) => showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              verticalSpacing,
              AppTextBtn(
                onPressed: _chooseImageFromGallery,
                label: 'اختر من الاستديو',
                iconData: Icons.photo_library,
              ),
              AppTextBtn(
                onPressed: _takePictureByCamera,
                label: 'إلتقاط صورة',
                iconData: Icons.camera,
              ),
              verticalSpacing,
            ],
          );
        },
      );

  // Taking Picture
  Future<void> _takePictureByCamera() async {
    final pickedImage = await picker.pickImage(
      source: ImageSource.camera,
      // imageQuality form 0 => 100
      imageQuality: 100,
    );

    setState(() {
      pickedImageFile = File(pickedImage!.path);
      isThereImage = true;
    });
  }

  // Taking Picture
  Future<void> _chooseImageFromGallery() async {
    final pickedImage = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 100,
    );

    setState(() {
      pickedImageFile = File(pickedImage!.path);
      isThereImage = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'أضف صورة',
              textAlign: TextAlign.end,
              style: kTitleStyle,
            ),
            const SizedBox(height: 8.0),
            Container(
              padding: isThereImage
                  ? const EdgeInsets.symmetric(vertical: 16.0, horizontal: 14.0)
                  : EdgeInsets.zero,
              decoration: kAppContainerDec,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: isThereImage
                    ? SizedBox(
                        height: size.height * 0.45,
                        width: size.width * 0.8,
                        child: Image.file(pickedImageFile!, fit: BoxFit.cover),
                      )
                    : Image.asset('assets/images/no-image.png'),
              ),
            ),
            const SizedBox(height: 20.0),
            AppBtn(
              onPressed: () => showBottomSheet(context),
              label: isThereImage ? 'تغيير الصورة' : 'إضافة صورة',
              size: size,
            ),
            verticalSpacing,
            if (isThereImage)
              AppBtn(
                onPressed: () {
                  setState(() {
                    pickedImageFile = null;
                    isThereImage = false;
                  });
                },
                label: 'حذف الصورة',
                size: size,
              ),
            verticalSpacing,
            if (isThereImage)
              AppBtn(
                onPressed: () =>
                    recognizeImage(context, image: pickedImageFile!),
                label: 'تحليل العناصر في الصورة',
                size: size,
              ),
          ],
        ),
      ),
    );
  }
}

class AppBtn extends StatelessWidget {
  const AppBtn({
    Key? key,
    required this.onPressed,
    required this.label,
    required this.size,
  }) : super(key: key);

  final Function() onPressed;
  final String label;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        label,
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      style: ElevatedButton.styleFrom(
        elevation: 0.0,
        minimumSize: Size(size.width * 0.8, 50.0),
        primary: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
