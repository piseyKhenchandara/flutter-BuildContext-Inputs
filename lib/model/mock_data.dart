import 'package:buildcontext_inputs/model/expenses_model.dart';
import 'package:flutter/material.dart';

List<ExpensesModel> mockData = [
  ExpensesModel(
    title: "Flutter Course",
    price: 15.5,
    icon: const Icon(Icons.school),
    date: DateTime(2024, 1, 15),
  ),
  ExpensesModel(
    title: "Grocery Shopping",
    price: 45.99,
    icon: const Icon(Icons.shopping_bag),
    date: DateTime(2024, 1, 18),
  ),
  ExpensesModel(
    title: "Netflix Subscription",
    price: 12.99,
    icon: const Icon(Icons.movie),
    date: DateTime(2024, 2, 1),
  ),
  ExpensesModel(
    title: "Gym Membership",
    price: 30.00,
    icon: const Icon(Icons.fitness_center),
    date: DateTime(2024, 2, 5),
  ),
  ExpensesModel(
    title: "Restaurant Dinner",
    price: 62.50,
    icon: const Icon(Icons.restaurant),
    date: DateTime(2024, 2, 10),
  ),
  ExpensesModel(
    title: "Uber Ride",
    price: 8.75,
    icon: const Icon(Icons.directions_car),
    date: DateTime(2024, 2, 12),
  ),
  ExpensesModel(
    title: "Coffee Shop",
    price: 5.30,
    icon: const Icon(Icons.coffee),
    date: DateTime(2024, 2, 14),
  ),
  ExpensesModel(
    title: "Amazon Purchase",
    price: 89.99,
    icon: const Icon(Icons.shopping_cart),
    date: DateTime(2024, 2, 16),
  ),
];
