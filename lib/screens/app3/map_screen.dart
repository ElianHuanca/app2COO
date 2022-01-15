import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:proyectosig/blocs/blocs.dart';

import 'package:proyectosig/views/views.dart';
import 'package:proyectosig/widgets/manual_marker3.dart';
import 'package:proyectosig/widgets/widgets.dart';

class MapScreen3 extends StatefulWidget {
  const MapScreen3({Key? key}) : super(key: key);
  @override
  State<MapScreen3> createState() => _MapScreenState3();
}

class _MapScreenState3 extends State<MapScreen3> {
  late LocationBloc locationBloc;
  //AlarmaService? alarma;
  @override
  void initState() {
    super.initState();
    locationBloc = BlocProvider.of<LocationBloc>(context);
    //locationBloc.getCurrentPosition();
    locationBloc.startFollowingUser();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    locationBloc.stopFollowingUser();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LocationBloc, LocationState>(
        builder: (context, locationState) {
          if (locationState.lastKnownLocation == null) {
            return const Center(child: Text('Espere por favor...'));
          }
          return BlocBuilder<MapBloc, MapState>(
            builder: (context, mapState) {
              Map<String, Polyline> polylines = Map.from(mapState.polylines);
              if (!mapState.showMyRoute) {
                polylines.removeWhere((key, value) => key == 'myRoute');
              }
              return SingleChildScrollView(
                child: Stack(
                  children: [
                    MapView(
                      initialLocation: locationState.lastKnownLocation!,
                      polylines: mapState.polylines.values.toSet(),
                    ),
                    /* const SearchBar(), */
                    const ManualMarker3()
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: const [
          /* BtnToggleUserRoute(), */
          BtnCurrentLocation(),
          /* BtnFollowUser(), */
        ],
      ),
    );
  }
}
