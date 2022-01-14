import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_screen.dart';

class AttractionListHeader extends StatelessWidget {
  const AttractionListHeader({
    Key? key,
    required this.termChangedNotifier,
    required this.layoutChangedNotifier,
  }) : super(key: key);

  final ValueNotifier<String> termChangedNotifier;
  final ValueNotifier<LayoutType> layoutChangedNotifier;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _ListLayoutToggle(
              layoutChangedNotifier: layoutChangedNotifier,
            ),
            const _LightModeToggle(),
          ],
        ),
        const _HeaderText(),
        const SizedBox(height: 30),
        _HeaderSearchBar(onChanged: (term) {
          termChangedNotifier.value = term;
        }),
        const SizedBox(height: 15),
      ],
    );
  }
}

class _LightModeToggle extends StatefulWidget {
  const _LightModeToggle({Key? key}) : super(key: key);

  @override
  State<_LightModeToggle> createState() => _LightModeToggleState();
}

class _LightModeToggleState extends State<_LightModeToggle> {
  @override
  Widget build(BuildContext context) {
    AdaptiveThemeMode mode = AdaptiveTheme.of(context).mode;

    IconData icon =
        mode == AdaptiveThemeMode.light ? Icons.dark_mode : Icons.light_mode;

    return IconButton(
      icon: Icon(icon),
      onPressed: () {
        switch (mode) {
          case AdaptiveThemeMode.light:
            AdaptiveTheme.of(context).setDark();
            break;
          case AdaptiveThemeMode.dark:
            AdaptiveTheme.of(context).setLight();
            break;
          default:
            AdaptiveTheme.of(context).setDark();
        }

        _toggleIcon();
      },
    );
  }

  void _toggleIcon() {
    setState(() {});
  }
}

class _ListLayoutToggle extends StatefulWidget {
  const _ListLayoutToggle({
    Key? key,
    required this.layoutChangedNotifier,
  }) : super(key: key);

  final ValueNotifier<LayoutType> layoutChangedNotifier;

  @override
  __ListLayoutToggleState createState() => __ListLayoutToggleState();
}

class __ListLayoutToggleState extends State<_ListLayoutToggle> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: ValueListenableBuilder<LayoutType>(
          valueListenable: widget.layoutChangedNotifier,
          builder: (context, layout, child) {
            final IconData icon =
                layout == LayoutType.list ? Icons.grid_view : Icons.list;
            return Icon(icon);
          }),
      onPressed: () {
        final current = widget.layoutChangedNotifier.value;
        widget.layoutChangedNotifier.value =
            current == LayoutType.list ? LayoutType.grid : LayoutType.list;
      },
    );
  }
}

class _HeaderText extends StatelessWidget {
  const _HeaderText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Text(
      'Where do you want to go?',
      style: textTheme.headline3?.copyWith(
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class _HeaderSearchBar extends StatelessWidget {
  const _HeaderSearchBar({Key? key, required this.onChanged}) : super(key: key);

  final ValueSetter<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      key: const Key('searchBar_textField'),
      style: GoogleFonts.roboto(),
      decoration: InputDecoration(
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        prefixIcon: const Icon(Icons.search),
        hintText: 'search for a city, country or sight',
        hintStyle: GoogleFonts.roboto(),
      ),
      onChanged: onChanged,
    );
  }
}
