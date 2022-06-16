import 'package:flutter/material.dart';
import 'package:image_items_identification/widgets/image_item_txt_wd.dart';

class ImageItem extends StatelessWidget {
  const ImageItem({
    Key? key,
    required this.confidenceData,
    required this.indexData,
    required this.imagesData,
  }) : super(key: key);

  final String confidenceData;
  final String indexData;
  final String imagesData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 16.0,
      ),
      margin: const EdgeInsets.only(bottom: 12.0),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Colors.orange,
            Colors.blue,
          ],
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextImageItem(label: indexData),
          TextImageItem(label: confidenceData),
          TextImageItem(label: imagesData),
        ],
      ),
    );
  }
}
