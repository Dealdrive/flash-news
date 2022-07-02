class Country {
  final String name;
  final String code;

  Country({
    required this.name,
    required this.code,
  });

  static List<Country> countries = [
    Country(
      name: "Nigeria",
      code: "ng",
    ),
    Country(
      name: "United Kingdom",
      code: "gb",
    ),
    Country(
      name: "USA",
      code: "us",
    ),
    Country(
      name: "India",
      code: "in",
    ),
    Country(
      name: "South Africa",
      code: "za",
    ),
  ];
}
