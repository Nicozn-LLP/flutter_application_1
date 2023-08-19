import 'package:flutter/material.dart';

class SearchingBar extends StatelessWidget {
  final Function(String) onTextChanged;

  SearchingBar({Key? key, required this.onTextChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Container(
          alignment: Alignment.bottomCenter,
          margin: EdgeInsets.fromLTRB(10, 20, 10, 10),
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: Color(0x12000000),
                offset: const Offset(
                  5.0,
                  5.0,
                ),
                blurRadius: 5.0,
                spreadRadius: 2.0,
              ),
            ],
          ),
          child: ClipRRect(
            child: TextField(
              textAlignVertical: TextAlignVertical.bottom,
              style: TextStyle(color: Colors.black),
              onChanged: onTextChanged,
              decoration: InputDecoration(
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.black,
                  size: 20,
                ),
                hintText: 'What are you looking for?',
                hintStyle: TextStyle(
                  fontSize: 15,
                  color: Color(0x55000000),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
