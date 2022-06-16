import 'package:flutter/material.dart';

const verticalSpacing = SizedBox(height: 8.0);

const appDivider = Divider(
  thickness: 2,
  color: Colors.amber,
);

const appBorderRadius = BorderRadius.all(Radius.circular(40.0));

final kAppContainerDec = BoxDecoration(
  border: Border.all(
    color: Colors.orange,
    width: 2.0,
  ),
  borderRadius: BorderRadius.circular(10.0),
);

const kTitleStyle = TextStyle(
  fontWeight: FontWeight.bold,
  color: Colors.orange,
  fontSize: 20.0,
);

const kSubtitleStyle = TextStyle(
  fontWeight: FontWeight.bold,
  color: Colors.blue,
  fontSize: 16.0,
);
