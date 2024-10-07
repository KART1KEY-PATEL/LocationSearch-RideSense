import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:location_search/app_provider.dart';
import 'package:location_search/pages/location_search/location_search_page.dart';
import 'package:provider/provider.dart';
import 'app_theme.dart';
import 'app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();

  // Ensure the app runs in portrait mode
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // // Check if running in debug mode (or in your case, emulator)
  // if (const bool.fromEnvironment('dart.vm.product') == false) {
  //   _connectToFirebaseEmulator(); // Connect to the local emulator
  // }

  runApp(
    MultiProvider(
      providers: appProviders(),
      child: DevicePreview(
        enabled: false,
        builder: (context) => const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: 'WorkWaves',
      debugShowCheckedModeBanner: false,
      theme: appTheme(context),
      home: LocationSearchPage(),
      routes: appRoutes,
    );
  }
}
