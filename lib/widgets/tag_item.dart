import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:focus/constants/colors.dart';
import 'package:focus/provider/count_provider.dart';

class Tag extends ConsumerStatefulWidget {
  final String title;
  const Tag({super.key, required this.title});

  @override
  ConsumerState<Tag> createState() => _TagState();
}

class _TagState extends ConsumerState<Tag> {
  bool isAdded = false;
  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(countProvider);

    if (provider.categories.contains(widget.title)) {
      isAdded = true;
    }
    return GestureDetector(
      onTap: () {
        setState(() {
          isAdded = !isAdded;
        });
        ref.read(countProvider.notifier).toggleToCategory(widget.title);
      },
      child: Container(
        margin: const EdgeInsets.only(left: 15),
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        decoration: BoxDecoration(
            color: isAdded
                ? const Color.fromARGB(255, 168, 215, 170)
                : secondaryColor,
            borderRadius: BorderRadius.circular(10)),
        child: Center(
            child: Text(
          widget.title,
          style: const TextStyle(
            fontSize: 18,
          ),
        )),
      ),
    );
  }
}
