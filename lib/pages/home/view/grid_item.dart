import 'package:cached_network_image/cached_network_image.dart';
import 'package:citysaurus/core/models/models.dart';
import 'package:flutter/material.dart';

class AttrationGridItem extends StatelessWidget {
  const AttrationGridItem({
    Key? key,
    required this.attraction,
    required this.onItemTap,
  }) : super(key: key);

  final Attraction attraction;
  final Function(Attraction) onItemTap;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      child: GridTile(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: _GridItemImage(
                url: attraction.imageUrl,
                width: screenSize.width / 2,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              attraction.name,
              style: textTheme.bodyText1?.copyWith(
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(attraction.city.fullName),
          ],
        ),
      ),
      onTap: () {
        onItemTap.call(attraction);
      },
    );
  }
}

class _GridItemImage extends StatelessWidget {
  const _GridItemImage({
    Key? key,
    required this.url,
    required this.width,
  }) : super(key: key);

  final String url;
  final double width;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: CachedNetworkImage(
        fit: BoxFit.fitWidth,
        width: width,
        imageUrl: url,
        placeholder: (context, url) => Container(
          width: width,
          decoration: BoxDecoration(color: Colors.grey[200]),
        ),
      ),
    );
  }
}
