import 'package:flutter/material.dart';
import 'package:news_app/models/country.dart';

class NavDrawer extends StatelessWidget {
  final Function(Country country) onTap;

  const NavDrawer({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: Theme.of(context).primaryColor,
            height: 150,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.flash_on,
                      color: Colors.white,
                      size: 24,
                    ),
                    SizedBox(width: 4),
                    Text(
                      "FLASH NEWS",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            color: Colors.grey.shade300,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                "Headlines From",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: Country.countries
                  .map((country) => _countryItem(
                        context,
                        country,
                        onTap,
                      ))
                  .toList(),
            ),
          )
        ],
      ),
    );
  }

  Widget _countryItem(
    BuildContext context,
    Country country,
    Function(Country) onTap,
  ) {
    return ListTile(
      onTap: () {
        onTap(country);
        Navigator.of(context).pop();
      },
      leading: SizedBox(
        width: 24,
        height: 24,
        child: Image.asset(
          "icons/flags/png/${country.code}.png",
          package: "country_icons",
        ),
      ),
      title: Text(country.name),
    );
  }
}
