import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_items_identification/constants.dart';
import 'package:image_items_identification/widgets/image_item_wg.dart';

class ImageItemsPage extends StatelessWidget {
  const ImageItemsPage(
      {Key? key,
      required this.imagesData,
      required this.indexData,
      required this.confidenceData,
      required this.image})
      : super(key: key);

  final List<String> imagesData;
  final List<String> indexData;
  final List<String> confidenceData;
  final File image;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(
            right: 12.0,
            left: 12.0,
            top: 20.0,
            bottom: 6.0,
          ),
          child: Column(
            children: [
              // AppBar
              Container(
                alignment: Alignment.centerRight,
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    Icons.arrow_forward_outlined,
                  ),
                ),
              ),

              // Image
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 16.0,
                  horizontal: 14.0,
                ),
                decoration: kAppContainerDec,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: SizedBox(
                    height: size.height * 0.3,
                    width: size.width * 0.8,
                    child: Image(
                      image: FileImage(image),
                      fit: BoxFit.cover,
                      width: double.maxFinite,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    'نتائج التحليل',
                    style: kTitleStyle,
                  ),
                  verticalSpacing,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'رقم الفهرسة',
                        style: kSubtitleStyle,
                      ),
                      Text(
                        'الاحتمال',
                        style: kSubtitleStyle,
                      ),
                      Text(
                        'اسم العنصر',
                        style: kSubtitleStyle,
                      ),
                    ],
                  ),
                  verticalSpacing,
                  SizedBox(
                    height: size.height * 0.35,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: imagesData.length,
                      itemBuilder: (context, index) {
                        return ImageItem(
                          confidenceData: confidenceData[index],
                          indexData: indexData[index],
                          imagesData: imagesData[index],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
