import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location_search/pages/location_search/map_page.dart';

class LocationSearchPage extends StatefulWidget {
  const LocationSearchPage({super.key});

  @override
  State<LocationSearchPage> createState() => _LocationSearchPageState();
}

class _LocationSearchPageState extends State<LocationSearchPage> {
  final TextEditingController _locationController = TextEditingController();
  String? _errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter Location'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _locationController,
              decoration: InputDecoration(
                labelText: 'Location',
                hintText: 'Enter a city, address, or coordinates',
                errorText: _errorMessage,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _handleSubmit,
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  void _handleSubmit() {
    if (_locationController.text.isEmpty) {
      setState(() {
        _errorMessage = 'Please enter a location';
      });
    } else {
      // Assume you have another screen called 'ResultsPage' to navigate to
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ResultsPage(
                  location: _locationController.text,
                )),
      );
    }
  }

  @override
  void dispose() {
    _locationController.dispose();
    super.dispose();
  }
}
