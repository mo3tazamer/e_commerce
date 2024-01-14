import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProFileText extends StatelessWidget {
  ProFileText({super.key, required this.text});
  String? text;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * .90,
            maxHeight: MediaQuery.of(context).size.height * .08),
        width: MediaQuery.of(context).size.width * .90,
        height: MediaQuery.of(context).size.height * .08,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 1, color: Colors.blue),
            color: Colors.white54),
        child: Text(text!, style: TextStyle(fontSize: 20.sp)));
  }
}
