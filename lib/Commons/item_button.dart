import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ItemButton extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback? onItemPressed;

  const ItemButton({
    super.key,
    required this.title,
    //Default value for the color
    this.color = Colors.blue,
    this.onItemPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(4),
              ),
              height: 56,
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              child: Center(
                child: Text(
                  title,
                  style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            ),
            onTap: onItemPressed,
          ),
        )
      ],
    );
  }
}
