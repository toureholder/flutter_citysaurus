class City {
  final String name;
  final String countryName;

  City(this.name, this.countryName);

  String get fullName {
    return name + ', ' + countryName;
  }

  // For mocking purposes

  factory City.fake() {
    return City(
      'Bridgetown',
      'Barbados',
    );
  }
}
