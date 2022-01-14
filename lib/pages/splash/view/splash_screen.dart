import 'package:citysaurus/core/models/models.dart';
import 'package:citysaurus/pages/pages.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/splash';

  const SplashScreen({Key? key, required this.bloc}) : super(key: key);

  final SplashBloc bloc;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    widget.bloc.loadAttractions();
    _onLoaded();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icons/citysaurus.png',
              width: 128,
              height: 128,
            ),
            Text(
              'Citysaurus',
              style: textTheme.headline6?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }

  _onLoaded() {
    widget.bloc.stream.listen(_onSuccess, onError: _onError);
  }

  _onSuccess(List<Attraction> data) {
    widget.bloc.dispose();
    Navigator.pushNamedAndRemoveUntil(
      context,
      HomeScreen.routeName,
      (route) => false,
      arguments: HomeScreenArguments(attractions: data),
    );
  }

  _onError(error) {
    // TODO: handle error
  }
}
