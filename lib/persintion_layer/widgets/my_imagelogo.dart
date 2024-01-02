import 'package:flutter/material.dart';

class MyImageLogo extends StatelessWidget {
  final String imagePath;
  const MyImageLogo({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(16),
            color: Colors.grey[200],
          ),
          child: Image(
            image: AssetImage(
              imagePath,
            ),
            height: 55,
          ),
        ),
        Positioned.fill(
            child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            onTap: () {},
          ),
        ))
      ],
    );
  }
}
