import 'package:flutter/material.dart';

class ExpensesModel {
  String title;
  final double price;
  final Icon? icon;
  final DateTime? date;

  ExpensesModel({
    required this.title,
    required this.price,
    this.icon,
    this.date,
  });
}
