import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
PreferredSizeWidget MyAppBar() {
  return AppBar(
    centerTitle: true,
    title: Image.asset(
      'assets/intesasoft_logo.png',
      height: 40,
    ),
    actions: [
      Container(
        margin: const EdgeInsets.only(right: 10),
        decoration:
            const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
        child: const Icon(
          Icons.person,
          color: Colors.white,
        ),
      )
    ],
  );
}
