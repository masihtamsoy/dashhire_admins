import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dash_widget/store/jobs_store.dart';
import 'package:dash_widget/dash_widget.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'configure_nonweb.dart' if (dart.library.html) 'configure_web.dart';
import 'screens/jobs_listing.dart';
import 'screens/profile_screen.dart';
import 'screens/signin_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/web_home_screen.dart';
import 'screens/journey.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final JobsStore _jobsStore = JobsStore();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<JobsStore>(create: (_) => _jobsStore),
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
                '/jobs': (_) => JobsListingScreen(),
                '/second': (_) => const Journey(),
              },
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
