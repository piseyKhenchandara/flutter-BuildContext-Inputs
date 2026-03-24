import 'package:buildcontext_inputs/model/expenses_model.dart';
import 'package:buildcontext_inputs/model/mock_data.dart';
import 'package:buildcontext_inputs/ui/ExpenseForm.dart';
import 'package:buildcontext_inputs/ui/listexpense.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: "BuildContext_input",
      debugShowCheckedModeBanner: false,
      home: homepage(),
    ),
  );
}

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  void deleteCard(int index) {
    setState(() {
      mockData.removeAt(index);
    });
  }

  void editCard(
    int index, {
    String? title,
    double? price,
    ExpenseCategory? category,
    DateTime? date,
  }) {
    setState(() {
      if (title != null) {
        mockData[index].title = title;
      }
      if (price != null) {
        mockData[index].price = price.toDouble();
      }
      if (category != null) {
        mockData[index].category = category;
      }
      if (date != null) {
        mockData[index].date = date;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ronan-The-Best Expenses App"),
        /* leading: Icon(Icons.back_hand), */
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (ctx) => ExpenseForm(
                  onCreateExpense: (title, amount, category) {
                    setState(() {
                      mockData.add(
                        ExpensesModel(
                          title: title,
                          price: double.parse(amount),
                          category: category,
                          date: DateTime.now(),
                        ),
                      );
                    });
                  },
                ),
              );
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: listExpense(callback: deleteCard, onCallBackEdit: editCard),
    );
  }
}
