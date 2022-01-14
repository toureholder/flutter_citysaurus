import 'package:cached_network_image/cached_network_image.dart';
import 'package:citysaurus/core/models/models.dart';
import 'package:flutter/material.dart';

class AttratcionListItem extends StatelessWidget {
  const AttratcionListItem({
    Key? key,
    required this.attraction,
    required this.onItemTap,
  }) : super(key: key);

  final Attraction attraction;
  final Function(Attraction) onItemTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        border: Border.all(
          color: Colors.grey[300] ?? Colors.grey,
          width: 1,
        ),
      ),
      child: ListTile(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 0.0,
          horizontal: 8.0,
        ),
        leading: _ListItemImage(url: attraction.imageUrl),
        title: Text(attraction.name),
        subtitle: Text(attraction.city.fullName),
        onTap: () {
          onItemTap.call(attraction);
        },
      ),
    );
  }
}

class _ListItemImage extends StatelessWidget {
  const _ListItemImage({Key? key, required this.url}) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    const double size = 64.0;

    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: CachedNetworkImage(
        fit: BoxFit.cover,
        width: size,
        height: size,
        imageUrl: url,
        placeholder: (context, url) => Container(
          height: size,
          width: size,
          decoration: BoxDecoration(color: Colors.grey[200]),
        ),
      ),
    );
  }
}
