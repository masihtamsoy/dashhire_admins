// Store
import 'package:dash_widget/store/listing_store.dart';
import 'store/applications_store.dart';
import 'store/dash_store.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'configure_nonweb.dart' if (dart.library.html) 'configure_web.dart';
import 'screens/jobs_listing.dart';
import 'screens/applicants_listing.dart';
import 'screens/profile_screen.dart';
import 'screens/signin_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/web_home_screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ListingStore _listingStore = ListingStore();
  final DashStore _dashStore = DashStore();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ListingStore>(create: (_) => _listingStore),
        Provider<DashStore>(create: (_) => _dashStore),
      ],
      child: Observer(
          name: 'global-observer',
          builder: (context) {
            return MaterialApp(
              title: 'Dashhire admins',
              theme: ThemeData.light(),
              initialRoute: '/',
              routes: <String, WidgetBuilder>{
                '/signIn': (_) => SignInScreen(),
                '/profile': (_) => ProfileScreen(),
                // '/job': (_) => ListingScreen(),
                '/job': (_) => ListingScreen(
                    mode: 'company_role', pushRouteName: '/candidates_page'),
                '/application': (_) => ApplicationsListingScreen(),
                '/candidates_page': (_) => ListingScreen(
                      mode: 'candidate',
                    ),
              },
              debugShowCheckedModeBanner: false,
              onGenerateRoute: generateRoute,
            );
          }),
    );
  }
}

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    default:
      return MaterialPageRoute(
          builder: (_) => kIsWeb ? WebHomeScreen() : SplashScreen());
  }
}
