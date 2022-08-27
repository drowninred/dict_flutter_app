import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:practice1/Commons/item_button.dart';
import 'package:practice1/Item_Feature/item_model.dart';

//
enum ItemMode {
  creating,
  editing;
}

class NewItemPage extends StatefulWidget {
  //
  ItemModel? item;
  final ItemMode mode;
  NewItemPage({Key? key, this.item, required this.mode}) : super(key: key);

  @override
  State<NewItemPage> createState() => _NewItemPageState();
}

class _NewItemPageState extends State<NewItemPage> {
  //
  var _title = TextEditingController();
  var _description = TextEditingController();
  var _date = TextEditingController();
  @override
  Widget build(BuildContext context) {
    //
    if (widget.mode == ItemMode.editing) {
      _title.text = widget.item!.title;
      _description.text = widget.item!.description;
      _date.text = widget.item!.date;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.mode == ItemMode.creating
            ? 'New Item Page'
            : 'Edit Item Page'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _title,
            decoration: InputDecoration(labelText: 'Title'),
          ),
          TextField(
            controller: _description,
            decoration: InputDecoration(labelText: 'Description'),
            maxLines: 5,
          ),
          TextField(
            controller: _date,
            decoration: InputDecoration(labelText: 'Date'),
          ),
          Expanded(child: Row()),
          ItemButton(
              title: 'Save',
              onItemPressed: () {
                //Reconstraction of New Item Model
                ItemModel newItemModel = ItemModel(
                    title: _title.text,
                    description: _description.text,
                    date: _date.text);
                Navigator.pop(context, newItemModel);
              })
        ],
      ),
    );
  }
}
