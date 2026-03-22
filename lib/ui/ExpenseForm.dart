import 'package:flutter/material.dart';

class ExpenseForm extends StatefulWidget {
  final Function(String title, String amount) onCreateExpense;

  const ExpenseForm({super.key, required this.onCreateExpense});

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  late TextEditingController controller1;
  late TextEditingController controller2;

  String text1 = '';
  String text2 = '';

  @override
  void initState() {
    // TODO: implement initState
    controller1 = TextEditingController();
    controller2 = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
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
                  widget.onCreateExpense(controller1.text, controller2.text);

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
