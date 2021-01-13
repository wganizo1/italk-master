import 'package:flutter/material.dart';

final textInputDecoration = InputDecoration(
  hintStyle: TextStyle(color: Colors.grey.shade700),
  filled: true,
  // fillColor: Color(0xff161d27).withOpacity(0.9),
  enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(color:Colors.blueAccent)),
  focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(color: Colors.blueAccent)),
);