// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyectosig/screens/app3/loading_screen.dart';
import 'package:proyectosig/services/services.dart';
import 'package:proyectosig/widgets/widgets.dart';


class HomeScreen3 extends StatelessWidget {
  const HomeScreen3({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final productsService = Provider.of<AlarmaService>(context);
    if( productsService.isLoading ) return LoadingScreen();
    return Scaffold(
      appBar: AppBar(
        title: Text('Peticiones De Ayuda'),
      ),
      body: ListView.builder(
        itemCount: productsService.alarmas.length,
        itemBuilder: ( BuildContext context, int index ) => GestureDetector(
          onTap: () {
            productsService.selectedAlarmas = productsService.alarmas[index].copy();
            Navigator.pushNamed(context, 'loading3');
          },
          child: AlarmaCard(
            product: productsService.alarmas[index],
          ),
        )
      ),
      /* floatingActionButton: FloatingActionButton(
        child: Icon( Icons.add ),
        onPressed: () {
          productsService.selectedAlarmas= new Product(
            available: false, 
            name: '', 
            price: 0
          );
          Navigator.pushNamed(context, 'product');
        },
      ), */
   );
  }
}