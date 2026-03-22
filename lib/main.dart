import 'package:buildcontext_inputs/model/mock_data.dart';
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
                builder: (ctx) => const ExpenseForm(),
              );
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: listExpense(),
    );
  }
}

class listExpense extends StatelessWidget {
  const listExpense({super.key});

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
                      mockData[index].icon ?? Icon(Icons.error),
                      SizedBox(width: 20),
                      Text(mockData[index].date.toString()),
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

class ExpenseForm extends StatefulWidget {
  const ExpenseForm({super.key});

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  late TextEditingController controller;

  String text = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          TextField(
            controller: controller,
            onChanged: (String value) {
              setState(() {
                text = value;
              });
            },
          ),
          Text(text),
        ],
      ),
    );
  }
}
