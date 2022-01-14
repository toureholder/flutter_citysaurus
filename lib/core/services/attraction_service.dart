import 'dart:convert';

import 'package:citysaurus/core/models/models.dart';
import 'package:http/http.dart';

class AttractionService {
  AttractionService({required this.http});

  final Client http;

  Future<List<Attraction>> list() async {
    final Response response =
        await http.get(Uri.parse('https://api.npoint.io/5ecaa20ebea4d86084e5'));

    final List<dynamic> json = jsonDecode(
      response.body,
    );

    return json.map((e) => Attraction.fromJson(e)).toList();
  }
}
