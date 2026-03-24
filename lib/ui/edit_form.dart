import 'package:buildcontext_inputs/model/expenses_model.dart';
import 'package:flutter/material.dart';

class EditForm extends StatefulWidget {
  const EditForm({super.key});

  @override
  State<EditForm> createState() => _EditFormState();
}

class _EditFormState extends State<EditForm> {
  late TextEditingController _titleController;
  late TextEditingController _priceController;

  @override
  void initState() {
    // TODO: implement initState
    _titleController = TextEditingController();
    super.initState();
  }

  ExpenseCategory? _selectedCategory;
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(children: [
        TextFormField
        (controller: _titleController,),
    
      ]),
    );
  }
}
