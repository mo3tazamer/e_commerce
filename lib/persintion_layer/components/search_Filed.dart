import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  TextEditingController? controller;
  String? hintText;

  SearchField({super.key, this.controller, this.hintText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search),
            isDense: true,
            contentPadding: const EdgeInsets.all(12),
            hintText: hintText,
            enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide(
                  color: Colors.white,
                )),
            focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide(
                  color: Colors.grey.shade400,
                )),
            filled: true,
            fillColor: Colors.grey.shade200,
            hintStyle: TextStyle(color: Colors.grey.shade500)),
      ),
    );
  }
}
