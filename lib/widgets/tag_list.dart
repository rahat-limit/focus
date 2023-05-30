import 'package:flutter/material.dart';
import 'package:focus/widgets/tag_item.dart';

class TagList extends StatelessWidget {
  const TagList({super.key});

  @override
  Widget build(BuildContext context) {
    const List<String> tags = ['study', 'sport', 'rest', 'work'];
    return SizedBox(
      width: double.infinity,
      height: 50,
      // color: Colors.red,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Tag(title: tags[index]),
            ],
          );
        },
        itemCount: tags.length,
      ),
    );
  }
}
