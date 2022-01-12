
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyectosig/blocs/blocs.dart';
import 'package:proyectosig/src/pages/dashboard_page.dart';
import 'package:proyectosig/src/pages/pages.dart';
import 'package:proyectosig/screens/screens.dart';
import 'package:provider/provider.dart';
import 'package:proyectosig/services/services.dart';

//void main() => runApp(AppState());
void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => GpsBloc()),
        BlocProvider(create: (context) => LocationBloc()),
        BlocProvider(create: (context) => MapBloc(locationBloc: BlocProvider.of<LocationBloc>(context))),
        BlocProvider(create: (context) => SearchBloc(trafficService: TrafficService())),
      ], 
      child: AppState(),
    )
  );
}

class AppState extends StatefulWidget {
  @override
  _AppStateState createState() => _AppStateState();
}

class _AppStateState extends State<AppState> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SOS UAGRM',
        initialRoute: 'loading',
        routes: {
          'login': (_) => LoginScreen(),
          'home': (_) => HomeScreen(),
          'register': (_) => RegisterScreen(),
          'mapa': (_) => MapaPage(),
          'dashboard': (_) => HomePage(),
          'loading': (_) => LoadingScrenn(),
          'Gps': (_) => GpsAccessScreen(),
        },
        theme: ThemeData.light());
  }
}
