import 'package:flutter/material.dart';

class ProfileStoriesWidget extends StatelessWidget {
  final List<Color> colors = [
    Colors.red,
    Colors.pink,
    Colors.blue,
    Colors.cyan
  ];
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Wrap(
      spacing: 1,
      runSpacing: 1,
      children: List.generate(colors.length, (index) {
        return Container(
            height: index % 3 == 0 ? width : width / 2,
            width: index % 3 == 0 ? width : width / 2 - 0.5,
            color: colors[index]);
      }),
    );
  }
}
