import 'package:flutter/material.dart';
import 'package:parkpal/utils/app-colors.dart';
import 'package:parkpal/utils/fontstyles.dart';

class SearchBox extends StatelessWidget {
  final ValueChanged<String> onChanged; 

  const SearchBox({super.key, required this.onChanged});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: appcolor.teritiaryColor),
      child: TextFormField(
        style: Fontstyles.ButtonText1(context),
        onChanged: onChanged, 
        decoration: InputDecoration(
          isDense: true,
          prefixIcon: Icon(Icons.search, size: 20),
          prefixIconColor: appcolor.primaryColor,
          hintText: "Search..",
          hintStyle: Fontstyles.lightTextStyle(context),
          border: UnderlineInputBorder(borderSide: BorderSide.none),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        ),
      ),
    );
  }
}
