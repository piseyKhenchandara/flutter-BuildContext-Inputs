import 'package:flutter/material.dart';
import 'package:buildcontext_inputs/model/expenses_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ExpenseForm(onCreateExpense: (title, amount, category) {}),
      ),
    );
  }
}

class ExpenseForm extends StatefulWidget {
  final Function(String title, double amount, ExpenseCategory category)
  onCreateExpense;

  const ExpenseForm({super.key, required this.onCreateExpense});

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  final _formKey = GlobalKey<FormState>();

  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  ExpenseCategory? _selectedCategory;

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _submitForm() {
    final isValid = _formKey.currentState!.validate();

    if (!isValid || _selectedCategory == null) {
      return;
    }

    final title = _titleController.text.trim();
    final amount = double.parse(_amountController.text);

    widget.onCreateExpense(title, amount, _selectedCategory!);

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            // Title
            TextFormField(
              controller: _titleController,
              maxLength: 50,
              decoration: const InputDecoration(labelText: "Title"),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Please enter a title";
                }
                return null;
              },
            ),

            const SizedBox(height: 16),

            // Amount
            TextFormField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Amount"),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Please enter an amount";
                }

                final parsed = double.tryParse(value);
                if (parsed == null || parsed <= 0) {
                  return "Enter a valid number";
                }

                return null;
              },
            ),

            const SizedBox(height: 16),

            // Category Dropdown
            DropdownButtonFormField<ExpenseCategory>(
              value: _selectedCategory,
              decoration: const InputDecoration(labelText: "Category"),
              items: ExpenseCategory.values.map((cat) {
                return DropdownMenuItem(value: cat, child: Text(cat.name));
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedCategory = value;
                });
              },
              validator: (value) {
                if (value == null) {
                  return "Please select a category";
                }
                return null;
              },
            ),

            const SizedBox(height: 24),

            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Cancel"),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: _submitForm,
                  child: const Text("Create"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
