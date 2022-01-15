
// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyectosig/blocs/blocs.dart';
import 'package:proyectosig/screens/app1/loading_screen.dart';
import 'package:proyectosig/screens/app1/login_screen.dart';
import 'package:proyectosig/screens/app1/register_screen.dart';
import 'package:proyectosig/screens/app3/Home_screen.dart';
import 'package:proyectosig/screens/app3/loading_screen%20copy.dart';
import 'package:proyectosig/screens/app3/login_screen.dart';
import 'package:proyectosig/screens/app3/register_screen.dart';
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
        ChangeNotifierProvider(create: (_) => AlarmaService()),
        ChangeNotifierProvider(create: (_) => CiudadanoService()),
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
        initialRoute: 'login3',
        routes: {
          'login1': (_) => LoginScreen1(),
          'login3': (_) => LoginScreen3(),
          'register1': (_) => RegisterScreen1(),
          'register3': (_) => RegisterScreen3(),
          'home1': (_) => HomeScreen1(),
          'loading1':(_) => LoadingScreen1(),
          'home3':(_)=> HomeScreen3(),
          'loading3':(_) => LoadingScreen3(),
          'register': (_) => RegisterScreen(),
          'mapa': (_) => MapaPage(),
          'dashboard': (_) => HomePage(),
          'loading': (_) => LoadingScreen(),
          'Gps': (_) => GpsAccessScreen(),

        },
        theme: ThemeData.light());
  }
}
