import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/controllers_mixin.dart';
import '../models/train_boarding.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> with ControllersMixin<HomeScreen> {
  ///
  @override
  void initState() {
    super.initState();

    trainBoardingNotifier.getAllTrainBoarding();
  }

  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(child: displayTrainBoardingList()),
          ],
        ),
      ),
    );
  }

  ///
  Widget displayTrainBoardingList() {
    final List<Widget> list = <Widget>[];

    trainBoardingState.trainBoardingDateMap.forEach((String key, TrainBoardingModel value) {
      list.add(Text(key));
    });

    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) => list[index],
            childCount: list.length,
          ),
        ),
      ],
    );
  }
}
