import 'package:flutter/material.dart';

class TagsWidget extends StatelessWidget {
  const TagsWidget(
      {super.key, required this.tags, required this.devicePadding});

  final List tags;
  final Map<String, double> devicePadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: tags.isEmpty ? 0 : 30,
      margin: EdgeInsets.only(left: devicePadding["S"] as double),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: tags.isEmpty ? 0 : tags.length,
        itemBuilder: (context, index) {
          return Card(
              margin: EdgeInsets.only(right: devicePadding["XXS"] as double),
              child: Center(
                  child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: devicePadding["XXS"] as double),
                child: Text(tags[index].displayText),
              )));
        },
      ),
    );
  }
}
