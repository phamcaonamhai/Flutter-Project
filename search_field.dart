import 'package:flutter/material.dart';

class SearchField extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10.0,0, 10.0, 10.0),
      child: Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(30.0),
        child: TextField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 14.0),
            hintText: "Search your food",
            suffixIcon: Material(
              elevation: 5.0,
              borderRadius: BorderRadius.circular(30.0),
              child: Icon(
                Icons.search,
                color: Colors.black,
              ), // icon
            ),// suffixIcon
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

}