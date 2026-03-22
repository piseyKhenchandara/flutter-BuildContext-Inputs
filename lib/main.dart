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
    mockData.removeAt(index);
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
                  onCreateExpense: (title, amount) {
                    setState(() {
                      mockData.add(
                        ExpensesModel(
                          title: title,
                          price: double.parse(amount),
                          icon: Icon(Icons.attach_money),
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
      body: listExpense(
        callback: deleteCard,
      ),
    );
  }
}
