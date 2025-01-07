import 'package:flutter/material.dart';

class PageComponent extends StatelessWidget {
  final bool isAddNew;
  final String clipLabel;
  PageComponent({super.key, required this.isAddNew, required this.clipLabel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              if (!isAddNew) Icon(Icons.menu),
              SizedBox(width: 8),
              Image.asset(
                'assets/img.png',
                width: 60,
                height: 100,
                fit: BoxFit.cover,
              ),
            ],
          ),
          Text(
            clipLabel,
            style: TextStyle(fontSize: 18),
          ),
          isAddNew
              ? Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.file_open_outlined,
                color: Colors.deepPurpleAccent,
              ),
            ],
          )
              : Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.copy, color: Colors.deepPurpleAccent),
              SizedBox(width: 8),
              Icon(Icons.delete_outline, color: Colors.deepPurpleAccent),
            ],
          ),
        ],
      ),
    );
  }
}
