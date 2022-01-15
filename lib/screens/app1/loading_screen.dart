import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyectosig/blocs/blocs.dart';
import 'package:proyectosig/screens/app1/map_screen.dart';
import 'package:proyectosig/screens/screens.dart';

class LoadingScreen1 extends StatelessWidget {
  const LoadingScreen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<GpsBloc, GpsState>(
      builder: (context, state) {
        return state.isAllGranted ? const MapScreen1() : const GpsAccessScreen();
      },
    ));
  }
}
