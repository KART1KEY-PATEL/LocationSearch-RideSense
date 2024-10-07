import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location_search/services/location_service.dart';

class ResultsPage extends StatefulWidget {
  final String location;
  const ResultsPage({Key? key, required this.location}) : super(key: key);

  @override
  State<ResultsPage> createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  late GoogleMapController _controller;
  Future<LatLng>? _centerFuture;
  MapType _currentMapType = MapType.normal;

  @override
  void initState() {
    super.initState();
    _centerFuture = initializeCenter();
  }

  Future<LatLng> initializeCenter() async {
    LocationService locationService = LocationService();
    return await locationService.getCoordinatesFromAddress(widget.location);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location: ${widget.location}'),
        actions: <Widget>[
          _mapTypeSelector(),
        ],
      ),
      body: FutureBuilder<LatLng>(
        future: _centerFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GoogleMap(
              onMapCreated: _onMapCreated,
              mapType: _currentMapType,
              initialCameraPosition: CameraPosition(
                target: snapshot.data!,
                zoom: 11.0,
              ),
              markers: {_createMarker(snapshot.data!)},
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Failed to load map: ${snapshot.error}'));
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller = controller;
  }

  Marker _createMarker(LatLng center) {
    return Marker(
      markerId: MarkerId("loc"),
      position: center,
      infoWindow: InfoWindow(title: widget.location),
    );
  }

  Widget _mapTypeSelector() {
    return PopupMenuButton<MapType>(
      icon: Icon(Icons.layers),
      onSelected: (MapType value) {
        setState(() {
          _currentMapType = value;
        });
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<MapType>>[
        const PopupMenuItem<MapType>(
          value: MapType.normal,
          child: Text('Normal'),
        ),
        const PopupMenuItem<MapType>(
          value: MapType.satellite,
          child: Text('Satellite'),
        ),
        const PopupMenuItem<MapType>(
          value: MapType.terrain,
          child: Text('Terrain'),
        ),
        const PopupMenuItem<MapType>(
          value: MapType.hybrid,
          child: Text('Hybrid'),
        ),
      ],
    );
  }
}
