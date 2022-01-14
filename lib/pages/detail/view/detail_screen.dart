import 'package:cached_network_image/cached_network_image.dart';
import 'package:citysaurus/core/models/attraction.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key, required this.attraction}) : super(key: key);

  static const routeName = '/detail';

  final Attraction attraction;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                _DetailImage(url: attraction.imageUrl),
                const SizedBox(height: 15.0),
                _Title(attraction: attraction, textTheme: textTheme),
                const SizedBox(height: 5.0),
                _Location(attraction: attraction, textTheme: textTheme),
                const SizedBox(height: 30.0),
                _Description(attraction: attraction, textTheme: textTheme)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Description extends StatelessWidget {
  const _Description({
    Key? key,
    required this.textTheme,
    required this.attraction,
  }) : super(key: key);

  final TextTheme textTheme;
  final Attraction attraction;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About this attraction',
          style: textTheme.headline6?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(
          attraction.description,
          style: textTheme.bodyText1?.copyWith(fontSize: 16.0),
        ),
      ],
    );
  }
}

class _Location extends StatelessWidget {
  const _Location({
    Key? key,
    required this.attraction,
    required this.textTheme,
  }) : super(key: key);

  final Attraction attraction;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.place_outlined),
        const SizedBox(
          width: 10.0,
        ),
        Text(
          attraction.city.fullName,
          style: textTheme.bodyText1,
        ),
      ],
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({
    Key? key,
    required this.attraction,
    required this.textTheme,
  }) : super(key: key);

  final Attraction attraction;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Text(
      attraction.name,
      style: textTheme.headline4?.copyWith(
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class _DetailImage extends StatelessWidget {
  const _DetailImage({
    Key? key,
    required this.url,
  }) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: CachedNetworkImage(
            imageUrl: url,
            placeholder: (context, url) => Container(
              decoration: BoxDecoration(color: Colors.grey[200]),
            ),
          ),
        ),
        Positioned(
          top: 15.0,
          left: 15.0,
          child: RawMaterialButton(
            constraints: const BoxConstraints(
              minWidth: 36.0,
              maxWidth: 36.0,
              minHeight: 36.0,
              maxHeight: 36.0,
            ),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            onPressed: () {
              Navigator.pop(context);
            },
            elevation: 1.0,
            fillColor: Colors.white,
            child: const Icon(Icons.chevron_left, color: Colors.black54),
            shape: const CircleBorder(),
          ),
        )
      ],
    );
  }
}

class DetailScreenArguments {
  final Attraction attraction;

  DetailScreenArguments({required this.attraction});
}
