// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyectosig/models/alarma_model.dart';
import 'package:proyectosig/screens/app1/card_tipo.dart';
import 'package:proyectosig/services/alarma_service.dart';
//import 'package:proyectosig/widgets/card_container.dart';

class HomeScreen1 extends StatelessWidget {
  const HomeScreen1 ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsService = Provider.of<AlarmaService>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Center(
          child: Center(
              child: Text(
            'Home Screen',
            style: TextStyle(color: Colors.black87),
          )),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          cardAmbulancia(context,productsService),
          cardPolicia(context,productsService),
          cardBombero(context,productsService),
        ],
      ),
    );
  }

  Widget cardAmbulancia(BuildContext context,AlarmaService productsService) {
    TimeOfDay hora= TimeOfDay.now();
    DateTime fecha = DateTime.now();
    return GestureDetector(
      onTap: () {
        productsService.selectedAlarmas = AlarmaModel(estado: 'Por Confirmar', fecha: "${fecha.day}/${fecha.month}/${fecha.year}"  ,hora:"${hora.hour}:${hora.minute}", latitud: 1.0, longitud: 1.0, tipo: 'Ambulancia');
        Navigator.pushNamed(context, 'loading1');
      },
      child: CardTipo(
        startColor: Color.fromRGBO(33, 215, 170, 1.0),
        endColor: Color.fromRGBO(48, 133, 222, 1.0),
        child: InformationCard(
          titulo: 'Ambulancia',
          icono: Icon(
            Icons.health_and_safety,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget cardPolicia(BuildContext context,AlarmaService productsService) {
    TimeOfDay hora= TimeOfDay.now();
    DateTime fecha = DateTime.now();
    return GestureDetector(
      onTap: () {
        productsService.selectedAlarmas = AlarmaModel(estado: 'Por Confirmar', fecha: "${fecha.day}/${fecha.month}/${fecha.year}"  ,hora:"${hora.hour}:${hora.minute}", latitud: 1.0, longitud: 1.0, tipo: 'Policia');
        Navigator.pushNamed(context, 'loading1');
      },
      child: CardTipo(
        startColor: Color.fromRGBO(60, 106, 244, 1.0),
        endColor: Color.fromRGBO(206, 60, 222, 1.0),
        child: InformationCard(
          titulo: 'Policia',
          icono: Icon(
            Icons.policy,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget cardBombero(BuildContext context,AlarmaService productsService) {
    TimeOfDay hora= TimeOfDay.now();
    DateTime fecha = DateTime.now();
    return GestureDetector(
      onTap: () {
        productsService.selectedAlarmas = AlarmaModel(estado: 'Por Confirmar', fecha: "${fecha.day}/${fecha.month}/${fecha.year}"  ,hora:"${hora.hour}:${hora.minute}", latitud: 1.0, longitud: 1.0, tipo: 'Bomberos');
        Navigator.pushNamed(context, 'loading1');
      },
      child: CardTipo(
        startColor: Color.fromRGBO(255, 106, 45, 1.0),
        endColor: Color.fromRGBO(255, 165, 27, 1.0),
        child: InformationCard(
          titulo: 'Bombero',
          icono: Icon(
            Icons.fire_hydrant,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class InformationCard extends StatelessWidget {
  final icono;
  final String titulo;
  const InformationCard({
    Key? key,
    required this.icono,
    required this.titulo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    titulo,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
        Expanded(child: SizedBox()),
        Container(
          child: icono, //Image(image: image),
        ),
      ],
    );
  }
}
