import 'package:flutter/material.dart';
import 'package:sulala_app/src/data/countries_data.dart';
import 'package:sulala_app/src/widgets/inputs/search_bars/search_bar.dart';

class CountriesWidget extends StatefulWidget {
  final CountrySelectionCallback onCountrySelected;

  const CountriesWidget({Key? key, required this.onCountrySelected})
      : super(key: key);

  @override
  State<CountriesWidget> createState() => _CountriesWidgetState();
}

class _CountriesWidgetState extends State<CountriesWidget> {
  List<CountryInfo> filteredCountries = countriesData;

  void _filterCountries(String query) {
    setState(() {
      filteredCountries = countriesData
          .where((country) =>
              country.countryName.toLowerCase().contains(query.toLowerCase()) ||
              country.countryCode.contains(query))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: PrimarySearchBar(
            hintText: 'Search for a country',
            onChange: _filterCountries,
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: filteredCountries.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Image.asset(filteredCountries[index].flagImagePath),
                title: Text(filteredCountries[index].countryName),
                subtitle: Text(filteredCountries[index].countryCode),
                onTap: () {
                  // Pass the selected country info back to the parent widget
                  widget.onCountrySelected(filteredCountries[index]);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

typedef CountrySelectionCallback = void Function(CountryInfo countryInfo);
