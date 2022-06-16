import 'package:flutter/material.dart';

class AppTextBtn extends StatelessWidget {
  const AppTextBtn({
    Key? key,
    required this.onPressed,
    required this.label,
    required this.iconData,
  }) : super(key: key);

  final Function() onPressed;
  final String label;
  final IconData? iconData;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onPressed();
        Navigator.pop(context);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 8.0),
          Icon(iconData),
        ],
      ),
    );
  }
}
