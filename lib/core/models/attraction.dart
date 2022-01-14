import 'city.dart';

class Attraction {
  final int id;
  final String name;
  final String description;
  final String imageUrl;
  final City city;

  Attraction(this.id, this.name, this.description, this.imageUrl, this.city);

  factory Attraction.fromJson(Map<String, dynamic> json) {
    return Attraction(
        json['id'] as int,
        json['name'] as String,
        json['description'] as String,
        json['image'] as String,
        City(
          json['city'] as String,
          json['country'] as String,
        ));
  }

  String get characters {
    return name + city.name + city.countryName;
  }

  // For mocking
  factory Attraction.fake() {
    return Attraction(
      1,
      'Lorem',
      'Lorem ipsum dolor sit amet consectetur',
      'https://picsum.photos/id/237/200/300',
      City.fake(),
    );
  }

  static List<Attraction> fakeList() {
    final List<Attraction> list = <Attraction>[];

    for (int i = 0; i < 5; i++) {
      list.add(Attraction.fake());
    }

    return list;
  }
}
