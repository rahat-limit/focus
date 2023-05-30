import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:focus/constants/colors.dart';
import 'package:focus/provider/count_provider.dart';
import 'package:focus/services/local_storage.dart';

class SessionList extends StatelessWidget {
  const SessionList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final sessions = ref.watch(countProvider).sessions;
      return Expanded(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: sessions.length,
          itemBuilder: (context, index) {
            final session = sessions[index];
            String title = LocalStorage().fromListToString(session.category);
            title = title.replaceAll(',', ' ');
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              margin: const EdgeInsets.only(bottom: 10),
              child: ListTile(
                onTap: () {},
                tileColor: buttonColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                title: Text(
                  title,
                  maxLines: 1,
                  style: const TextStyle(
                      fontSize: 19, fontWeight: FontWeight.w700),
                ),
                subtitle: Text(
                  '${session.date.year}-${session.date.month}-${session.date.day}, ${session.date.minute}:${session.date.second}',
                  style: const TextStyle(
                      color: Colors.white60, fontWeight: FontWeight.bold),
                ),
                trailing: ClipRRect(
                    child: Text(
                  '${session.time}sec',
                  style: const TextStyle(fontFamily: 'lilita', fontSize: 20),
                )),
              ),
            );
          },
        ),
      );
    });
  }
}
