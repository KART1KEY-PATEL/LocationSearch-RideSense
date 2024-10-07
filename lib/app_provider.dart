// providers.dart
import 'package:location_search/controller/location_controller.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> appProviders() {
  return [
    ChangeNotifierProvider(create: (_) => LocationController()),
  ];
}
