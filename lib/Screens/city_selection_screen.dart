import 'package:flutter/material.dart';
import 'package:weather_app/Screens/home_screen.dart';

import '../essentials/pakistani_cities_only.dart';

class CitySelectionPage extends StatefulWidget {
  const CitySelectionPage({super.key});

  @override
  State<CitySelectionPage> createState() => _CitySelectionPageState();
}

class _CitySelectionPageState extends State<CitySelectionPage> {
  String? selectedCity;
  String? searchCity;
  List<String> citiesOfPakistan = pakistaniCities;
  List<String> filteredCities = [];

  @override
  void initState() {
    super.initState();
    // Initially show all cities
    filteredCities = citiesOfPakistan;
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController searchTextController = TextEditingController();
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: const Text('Select City'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.80,
                child: TextField(
                  controller: searchTextController,
                  onSubmitted: (value) {
                    setState(() {
                      searchCity = value;
                      filteredCities = _searchCities(citiesOfPakistan, value);
                    });
                  },
                  decoration: InputDecoration(
                    hintText: "Search Your City",
                    border: const OutlineInputBorder(),
                    suffixIcon: searchTextController.text.isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: () {
                              searchTextController.clear();
                              setState(() {
                                filteredCities = citiesOfPakistan;
                              });
                            },
                          )
                        : null,
                  ),
                  onTapOutside: (event) {
                    FocusScope.of(context).unfocus();
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.80,
                child: ListView.builder(
                  itemCount: filteredCities.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      child: ListTile(
                        leading: const Icon(Icons.location_city),
                        title: Text(
                          filteredCities[index],
                        ),
                        subtitle: const Text(
                          "Pakistan",
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          selectedCity = filteredCities[index];
                        });
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WeatherScreen(
                                      selectedCity: selectedCity!,
                                    )));
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }

  List<String> _searchCities(List<String> cities, String query) {
    query = query.toLowerCase();
    // Filter the cities list based on the query and return a new list
    return cities.where((city) => city.toLowerCase().contains(query)).toList();
  }
}
