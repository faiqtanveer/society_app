import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:society_app/resources/routes/app_route_config.dart';
import 'firebase_options.dart';

  void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
  );
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
   const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp.router(
      routerConfig: AppRouter.returnRouter(true),
      debugShowCheckedModeBanner: false,
      // routeInformationParser: AppRouter.returnRouter(true).routeInformationParser,
      // routerDelegate: AppRouter.returnRouter(true).routerDelegate,
      // routeInformationProvider: AppRouter.returnRouter(true).routeInformationProvider,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );

  }

}








