import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {
  final Function(String) onTap;

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
              children: [
                _countryItem(context, "ng", "Nigeria", onTap),
                _countryItem(context, "gb", "United Kingdom", onTap),
                _countryItem(context, "us", "United States", onTap),
                _countryItem(context, "in", "India", onTap),
                _countryItem(context, "za", "South Africa", onTap),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _countryItem(BuildContext context, String code, String name, Function(String) onTap) {
    return ListTile(
      onTap: (){
        onTap(code);
        Navigator.of(context).pop();
      },
      leading: SizedBox(
        width: 24,
        height: 24,
        child: Image.asset(
          "icons/flags/png/$code.png",
          package: "country_icons",
        ),
      ),
      title: Text(name),
    );
  }
}
