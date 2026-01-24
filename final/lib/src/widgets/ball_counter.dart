import 'package:flutter/material.dart';

class BallCount extends StatelessWidget {
  const BallCount({super.key, required this.ballsLeft});

  final ValueNotifier<int> ballsLeft;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: ballsLeft,
      builder: (context, ballsLeft, child) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
          child: Text(
            'Balls: $ballsLeft'.toUpperCase(),
            style: Theme.of(context).textTheme.titleSmall!,
          ),
        );
      },
    );
  }
}
