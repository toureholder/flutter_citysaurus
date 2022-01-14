import 'package:citysaurus/core/models/models.dart';
import 'package:citysaurus/pages/home/view/list_item.dart';
import 'package:flutter/material.dart';

class AttractionList extends StatelessWidget {
  const AttractionList({
    Key? key,
    required this.attractions,
    required this.onItemTap,
  }) : super(key: key);

  final List<Attraction> attractions;
  final Function(Attraction) onItemTap;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          height: 15.0,
        );
      },
      itemCount: attractions.length,
      itemBuilder: (BuildContext context, int index) {
        final Attraction item = attractions[index];
        return AttratcionListItem(attraction: item, onItemTap: onItemTap);
      },
    );
  }
}
