import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyectosig/blocs/blocs.dart';
import 'package:proyectosig/screens/app3/map_screen.dart';
import 'package:proyectosig/screens/screens.dart';

class LoadingScreen3 extends StatelessWidget {
  const LoadingScreen3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<GpsBloc, GpsState>(
      builder: (context, state) {
        return state.isAllGranted ? const MapScreen3() : const GpsAccessScreen();
      },
    ));
  }
}
