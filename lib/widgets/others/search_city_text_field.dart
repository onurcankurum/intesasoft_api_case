import 'package:flutter/material.dart';

class SearchCityTextField extends StatefulWidget {
 final  Function(String)? onChange;
 const  SearchCityTextField({Key? key, this.onChange}) : super(key: key);

  @override
  State<SearchCityTextField> createState() => _SearchCityTextFieldState();
}

class _SearchCityTextFieldState extends State<SearchCityTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: widget.onChange,
      decoration: const InputDecoration(
        hintText: "Şehir Giriniz",

        prefixIcon: Icon(
          Icons.search,
          color: Colors.grey,
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.black12, width: 1),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.black12, width: 1),
        ),

        // border: InputBorder(borderSide: BorderSide.merge(Bord, b))
      ),
    );
  }
}
