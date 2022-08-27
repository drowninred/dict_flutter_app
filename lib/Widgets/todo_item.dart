import 'package:flutter/material.dart';
import 'package:practice1/Other_Pages/details_page.dart';
import 'package:practice1/Item_Feature/item_model.dart';

class TodoItem extends StatelessWidget {
  final String title;
  final String description;
  final String date;

  const TodoItem({
    super.key,
    required this.title,
    required this.description,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) {
              return DetailsPage(
                  targetItem: ItemModel(
                      title: title, description: description, date: date));
            },
          ),
        );
      },
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 100,
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title),
                  Text(description),
                  Text(date),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
