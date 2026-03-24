import 'package:buildcontext_inputs/model/expenses_model.dart';

List<ExpensesModel> mockData = [
  ExpensesModel(
    title: "Flutter Course",
    price: 15.5,
    category: ExpenseCategory.work,
    date: DateTime(2024, 1, 15),
  ),
  ExpensesModel(
    title: "Grocery Shopping",
    price: 45.99,
    category: ExpenseCategory.shopping,
    date: DateTime(2024, 1, 18),
  ),
  ExpensesModel(
    title: "Netflix Subscription",
    price: 12.99,
    category: ExpenseCategory.leisure,
    date: DateTime(2024, 2, 1),
  ),
  ExpensesModel(
    title: "Gym Membership",
    price: 30.00,
    category: ExpenseCategory.leisure,
    date: DateTime(2024, 2, 5),
  ),
  ExpensesModel(
    title: "Restaurant Dinner",
    price: 62.50,
    category: ExpenseCategory.food,
    date: DateTime(2024, 2, 10),
  ),
  ExpensesModel(
    title: "Uber Ride",
    price: 8.75,
    category: ExpenseCategory.travel,
    date: DateTime(2024, 2, 12),
  ),
  ExpensesModel(
    title: "Coffee Shop",
    price: 5.30,
    category: ExpenseCategory.food,
    date: DateTime(2024, 2, 14),
  ),
  ExpensesModel(
    title: "Amazon Purchase",
    price: 89.99,
    category: ExpenseCategory.shopping,
    date: DateTime(2024, 2, 16),
  ),
];
