import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_items_identification/pages/image_items_page.dart';

void recognizeImage(BuildContext context, {required File image}) async {
  final imageLabeler = GoogleMlKit.vision.imageLabeler();
  final inputImage = InputImage.fromFilePath(image.path);
  final List<ImageLabel> labels = await imageLabeler.processImage(inputImage);

  final List<String> imagesData = [];
  final List<String> indexData = [];
  final List<String> confidenceData = [];

  for (ImageLabel label in labels) {
    final String item = label.label;
    final int index = label.index;
    
    final double probability = label.confidence * 100;

    imagesData.add(item);
    indexData.add(index.toString());
    confidenceData.add(probability.toStringAsFixed(1));
  }

  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => ImageItemsPage(
        imagesData: imagesData,
        indexData: indexData,
        confidenceData: confidenceData,
        image: image,
      ),
    ),
  );
}
