import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../Commons/item_button.dart';
import '../Item_Feature/item_model.dart';
import '../Other_Pages/new_item_page.dart';

class DetailsPage extends StatefulWidget {
  //Declared in the widget section
  final ItemModel targetItem;

  //This explaine the item constructor . . . |
  const DetailsPage({Key? key, required this.targetItem}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    //It(final ItemModel item;) could also be declared here
    return Scaffold(
      appBar: AppBar(
        title: Text('Details Page'),
      ),
      body: Column(
        children: [
          Text(
            widget.targetItem.title,
          ),
          Text(
            widget.targetItem.description,
          ),
          Text(
            widget.targetItem.date,
          ),
          Expanded(child: Row()),
          ItemButton(
              title: 'Edit Item',
              onItemPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) {
                      return NewItemPage(
                        mode: ItemMode.editing,
                        item: widget.targetItem,
                      );
                    },
                  ),
                ).then((updatedValue) {
                  if (updatedValue is ItemModel) {
                    Navigator.pop(context, updatedValue);
                  }
                });
              }),
          ItemButton(title: 'Delete', onItemPressed: () {}),
        ],
      ),
    );
  }
}
