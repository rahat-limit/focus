import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:focus/constants/colors.dart';
import 'package:focus/constants/functions.dart';
import 'package:focus/provider/count_provider.dart';
import 'package:focus/widgets/session_list.dart';

class ProgressScreen extends StatelessWidget {
  static const routeName = '/progress-page';
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const List<String> tags = ['study', 'sport', 'rest', 'work'];

    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            toolbarHeight: 75,
            leadingWidth: 80,
            title: const Text('progress',
                style: TextStyle(fontFamily: 'lilita', fontSize: 32))),
        body: Consumer(builder: (context, ref, child) {
          final sessions = ref.watch(countProvider).sessions;
          double sum = 0;
          for (var element in sessions) {
            sum += element.time;
          }
          List<PieChartSectionData> getSections() => sessions
              .asMap()
              .map<int, PieChartSectionData>((key, data) {
                final value = PieChartSectionData(
                  titleStyle:
                      const TextStyle(fontFamily: 'lilita', fontSize: 19),
                  color: defineColor(
                      data.category[0]), //identify color by category
                  value: double.parse(
                      (data.time.toDouble() / sum.round()).toStringAsFixed(2)),
                );
                return MapEntry(key, value);
              })
              .values
              .toList();
          Widget buildIndicator({required Color color, required String text}) =>
              Row(
                children: [
                  Container(
                    width: 16,
                    height: 16,
                    decoration:
                        BoxDecoration(shape: BoxShape.circle, color: color),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    text,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              );
          return Column(
            children: [
              Card(
                color: scaffoldColor,
                elevation: 0,
                child: Column(children: [
                  AspectRatio(
                      aspectRatio: 1.5,
                      child: PieChart(PieChartData(
                          sections: getSections(),
                          borderData: FlBorderData(show: false),
                          sectionsSpace: 2,
                          centerSpaceRadius: 70))),
                ]),
              ),
              Container(
                padding: const EdgeInsets.only(left: 30),
                width: double.infinity,
                height: 50,
                // color: scaffoldColor,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: tags.length,
                  itemBuilder: (context, index) {
                    String category = tags[index];
                    return buildIndicator(
                        color: defineColor(category),
                        text: category.replaceFirst(
                            category[0], category[0].toUpperCase()));
                  },
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const SessionList()
            ],
          );
        }));
  }
}
