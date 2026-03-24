import 'package:buildcontext_inputs/model/expenses_model.dart';
import 'package:flutter/material.dart';

class ExpenseForm extends StatefulWidget {
  final Function(String title, String amount, ExpenseCategory? category)
  onCreateExpense;

  const ExpenseForm({super.key, required this.onCreateExpense});

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  late TextEditingController controller1;
  late TextEditingController controller2;

  String text1 = '';
  String text2 = '';
  ExpenseCategory? _selectedCategory;

  @override
  void initState() {
    controller1 = TextEditingController();
    controller2 = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            maxLength: 50,
            decoration: InputDecoration(hintText: "Title"),
            controller: controller1,
            onChanged: (String value) {
              setState(() {
                text1 = value;
              });
            },
          ),

          SizedBox(height: 20),

          TextField(
            maxLength: 50,
            decoration: InputDecoration(hintText: "Amount"),
            controller: controller2,
            onChanged: (String value) {
              setState(() {
                text2 = value;
              });
            },
          ),

          SizedBox(height: 20),

          /* 
          items: ExpenseCategory.values.map((cat) {
            return DropdownMenuItem(
              value: cat,
              child: Text(cat.name),
            );
          }).toList(), 
          
           */
          DropdownButton(
            value: _selectedCategory,
            hint: Text("select one"),
            items: ExpenseCategory.values.map((cat) {
              return DropdownMenuItem(value: cat, child: Text(cat.name));
            }).toList(),
            onChanged: (value) {
              setState(() {
                _selectedCategory = value;
              });
            },
          ),

          SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancel"),
              ),
              SizedBox(width: 20),

              ElevatedButton(
                onPressed: () {
                  widget.onCreateExpense(
                    controller1.text,
                    controller2.text,
                    _selectedCategory,
                  );
                  Navigator.pop(context);
                },
                child: Text('Create'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
