import 'package:flutter/material.dart';

class DrawerTextField extends StatelessWidget {
  const DrawerTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.red[50],
              hintText: "Ara",

              prefixIcon: const Icon(
                Icons.search,
                color: Colors.grey,
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent, width: 0),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent, width: 0),
              ),
            ),
          );
  }
}