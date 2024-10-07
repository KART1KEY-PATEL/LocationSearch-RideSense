// app_routes.dart
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:location_search/pages/location_search/location_search_page.dart';
Map<String, WidgetBuilder> appRoutes = {
  '/locationSearchPage': (context) => LocationSearchPage(),
};
