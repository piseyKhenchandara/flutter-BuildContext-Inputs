import 'package:flutter/material.dart';

enum ExpenseCategory {
  food,
  travel,
  work,
  leisure,
  shopping;

  IconData get icon {
    switch (this) {
      case ExpenseCategory.food:
        return Icons.restaurant;
      case ExpenseCategory.travel:
        return Icons.flight;
      case ExpenseCategory.work:
        return Icons.work;
      case ExpenseCategory.leisure:
        return Icons.movie;
      case ExpenseCategory.shopping:
        return Icons.shopping_bag;
    }
  }
}

class ExpensesModel {
  String title;
  double price;
  ExpenseCategory? category; 
  DateTime? date;

  ExpensesModel({
    required this.title,
    required this.price,
    this.category,
    this.date,
  });
}
