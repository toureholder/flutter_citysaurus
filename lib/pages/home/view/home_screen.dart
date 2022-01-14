import 'package:citysaurus/core/models/models.dart';
import 'package:citysaurus/pages/home/view/empy_list_state.dart';
import 'package:citysaurus/pages/home/view/grid.dart';
import 'package:citysaurus/pages/home/view/list.dart';
import 'package:citysaurus/pages/home/view/list_header.dart';
import 'package:citysaurus/pages/pages.dart';
import 'package:citysaurus/util/double_value_listenable_builder.dart';
import 'package:flutter/material.dart';

enum LayoutType { list, grid }
const LayoutType defaultLayout = LayoutType.list;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.attractions}) : super(key: key);

  static const routeName = '/home';

  final List<Attraction> attractions;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ValueNotifier<String> _termChangedNotifier = ValueNotifier('');

  final ValueNotifier<LayoutType> _layoutChangedNotifier =
      ValueNotifier(defaultLayout);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 15.0,
            right: 15.0,
            bottom: 15.0,
          ),
          child: ListView(
            children: [
              AttractionListHeader(
                termChangedNotifier: _termChangedNotifier,
                layoutChangedNotifier: _layoutChangedNotifier,
              ),
              DoubleValueListenableBuilder<String, LayoutType>(
                first: _termChangedNotifier,
                second: _layoutChangedNotifier,
                builder: (BuildContext context, String term, LayoutType layout,
                    Widget? child) {
                  if (_filterList(term).isEmpty) {
                    return const EmptyListState();
                  }

                  return layout == LayoutType.list
                      ? AttractionList(
                          attractions: _filterList(term),
                          onItemTap: _onItemTap,
                        )
                      : AttractionGrid(
                          attractions: _filterList(term),
                          onItemTap: _onItemTap,
                        );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Attraction> _filterList(String term) {
    return widget.attractions
        .where(
          (it) => it.characters.toLowerCase().contains(term.toLowerCase()),
        )
        .toList();
  }

  void _onItemTap(Attraction attraction) {
    Navigator.pushNamed(
      context,
      DetailScreen.routeName,
      arguments: DetailScreenArguments(attraction: attraction),
    );
  }
}

class HomeScreenArguments {
  final List<Attraction> attractions;

  HomeScreenArguments({required this.attractions});
}
