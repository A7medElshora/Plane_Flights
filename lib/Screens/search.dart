import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  // final Function(String) onSearchResultSelected;

  // SearchPage({required this.onSearchResultSelected});
  final Function(String) onSearchResultSelected; // Define the callback function

  SearchPage({required this.onSearchResultSelected}); // Constructor with required parameter


  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;
  List<String> _searchResults = [];

  void _searchPlaces(String query) {
    // Replace this with your real search logic, fetching data from an API
    // For demonstration purposes, just simulating search results here
    List<String> results = [
      "New York City",
      "Paris",
      "London",
      "Tokyo",
      "Rome",
      "Sydney",
      "Dubai",
      "San Francisco",
      "Berlin",
      "Singapore",
      "Sersena",
    ];

    // Simulating a delay for fetching results (replace with async API call)
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _searchResults = results
            .where((place) => place.toLowerCase().contains(query.toLowerCase()))
            .toList();
        _isSearching = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Places'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, color: _isSearching ? Colors.blue : null),
                hintText: 'Search places...',
                filled: true,
                fillColor: _isSearching ? Colors.blue.withOpacity(0.1) : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _isSearching = true;
                });
                _searchPlaces(value);
              },
              onSubmitted: (value) {
                setState(() {
                  _isSearching = true;
                });
                _searchPlaces(value);
              },
            ),
          ),
          Expanded(
            child: _isSearching
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
              itemCount: _searchResults.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_searchResults[index]),
                  // Implement onTap functionality for each search result
                  onTap: () {
                    widget.onSearchResultSelected(_searchResults[index]);
                    Navigator.pop(context); // Close the search page
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
