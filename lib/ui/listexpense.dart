import 'package:buildcontext_inputs/model/expenses_model.dart';
import 'package:buildcontext_inputs/model/mock_data.dart';
import 'package:buildcontext_inputs/ui/edit_form.dart';
import 'package:flutter/material.dart';

class listExpense extends StatefulWidget {
  const listExpense({
    super.key,
    required this.callback,
    required this.onCallBackEdit,
  });

  final Function(
    int index, {
    String? title,
    double? price,
    ExpenseCategory? category,
    DateTime? date,
  })
  onCallBackEdit;

  final Function(int index) callback;

  @override
  State<listExpense> createState() => _listExpenseState();
}

class _listExpenseState extends State<listExpense> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: mockData.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  /* leading: Column(
                    children: [
                      Text(mockData[index].title),
                      Text(mockData[index].price.toString()),
                    ],
                  ), */
                  title: Text(mockData[index].title), // ✅
                  subtitle: Text("\$${mockData[index].price}"),

                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(mockData[index].category?.icon ?? Icons.error),
                      SizedBox(width: 20),
                      Text(mockData[index].date.toString()),
                      IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            /* isScrollControlled: true, */
                            builder: (ctx) => EditForm(),
                          );
                        },
                        icon: Icon(Icons.edit),
                        color: Colors.blue,
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            widget.callback(index);
                          });
                        },
                        icon: Icon(Icons.delete),
                        color: Colors.red,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
