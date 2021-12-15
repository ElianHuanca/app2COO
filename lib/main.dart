import 'package:flutter/material.dart';
import 'package:proyectosig/src/pages/dashboard_page.dart';
import 'package:proyectosig/src/pages/pages.dart';
import 'package:proyectosig/screens/screens.dart';
import 'package:provider/provider.dart';
import 'package:proyectosig/services/services.dart';

void main() => runApp(AppState());

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
      initialRoute: 'login',
      routes: {
        'login': (_) => LoginScreen(),
        'home': (_) => HomeScreen(),
        'register': (_) => RegisterScreen(),
        'mapa'      : ( _ ) => MapPage(),
        'dashboard':( _ ) => HomePage(),
        //'loading'   : ( _ ) => LoadingPage(),
        //'acceso_gps': ( _ ) => AccesoGpsPage(),
      },
      theme: ThemeData.light()
    );
  }
}