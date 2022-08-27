import 'package:flutter/material.dart';

import '../Commons/item_button.dart';
import '../Item_Feature/item_model.dart';
import '../Other_Pages/new_item_page.dart';
import '../Widgets/todo_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //
  List<ItemModel> todoItems = [];
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  for (int i = 0; i < todoItems.length; i++) ...[
                    TodoItem(
                        title: todoItems[i].title,
                        description: todoItems[i].description,
                        date: todoItems[i].date)
                  ],
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ItemButton(
                title: 'New Item',
                color: Colors.greenAccent,
                onItemPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) {
                      return NewItemPage(
                        mode: ItemMode.creating,
                      );
                    }),
                  ).then((value) {
                    if (value is ItemModel) {
                      //
                      setState(() {
                        todoItems.add(value);
                      });
                    }
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
