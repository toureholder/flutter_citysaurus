import 'package:flutter/cupertino.dart';

class EmptyListState extends StatelessWidget {
  const EmptyListState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(10.0),
      child: Center(
        child: Text('No attractions found. Try searching again.'),
      ),
    );
  }
}
