import 'package:flutter/material.dart';

class NotMatchTrainNameDisplayAlert extends StatefulWidget {
  const NotMatchTrainNameDisplayAlert({super.key, required this.notMatchTrainNameMapList});

  final List<Map<String, String>> notMatchTrainNameMapList;

  @override
  State<NotMatchTrainNameDisplayAlert> createState() => _NotMatchTrainNameDisplayAlertState();
}

class _NotMatchTrainNameDisplayAlertState extends State<NotMatchTrainNameDisplayAlert> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(child: displayNotMatchTrainNameList()),
          ],
        ),
      ),
    );
  }

  ///
  Widget displayNotMatchTrainNameList() {
    final List<Widget> list = <Widget>[];

    for (final Map<String, String> element in widget.notMatchTrainNameMapList) {
        list.add(
          Container(
            decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.white.withOpacity(0.3)))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(element['fromStation'] ?? ''),
                Text(element['toStation'] ?? ''),
              ],
            ),
          ),
        );
      }

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: list),
      ),
    );
  }
}
