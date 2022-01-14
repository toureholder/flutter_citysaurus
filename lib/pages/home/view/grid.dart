import 'package:citysaurus/core/models/models.dart';
import 'package:citysaurus/pages/home/view/grid_item.dart';
import 'package:flutter/material.dart';

class AttractionGrid extends StatelessWidget {
  const AttractionGrid({
    Key? key,
    required this.attractions,
    required this.onItemTap,
  }) : super(key: key);

  final List<Attraction> attractions;
  final Function(Attraction) onItemTap;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2.5,
        crossAxisSpacing: 15,
        mainAxisSpacing: 30,
      ),
      itemCount: attractions.length,
      itemBuilder: (BuildContext context, int index) {
        final Attraction item = attractions[index];
        return AttrationGridItem(
          attraction: item,
          onItemTap: onItemTap,
        );
      },
    );
  }
}
