import 'package:flutter/material.dart';
import 'package:proyectosig/src/pages/map_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Bandeja de Solicitudes"),
          backgroundColor: Colors.indigo,
        ),
        body: SafeArea(
            child: Container(
                child: ListView(
          children: [
            SizedBox(
              height: 50,
            ),
            InkWell(
                onTap: () {},
                child: Card(
                  child: ListTile(
                    leading: Icon(Icons.fire_hydrant),
                    title: Text('Solicitud 1'),
                    subtitle: Text('Necesito un Bombero'),
                    // trailing: Icon(Icons.fire_hydrant),
                  ),
                )),
            SizedBox(
              height: 50,
            ),
            InkWell(
                onTap: () {},
                child: Card(
                  child: ListTile(
                    leading: Icon(Icons.local_police_sharp),
                    title: Text('Solicitud 2'),
                    subtitle: Text('Se necesita policías!!!'),
                    // trailing: Icon(Icons.local_police_sharp),
                  ),
                )),
            SizedBox(
              height: 50,
            ),
            InkWell(
                onTap: () {},
                child: Card(
                  child: ListTile(
                    leading: Icon(Icons.local_hospital_sharp),
                    title: Text('Solicitud 3'),
                    subtitle: Text('Se requiere una Ambulancia Urgente !!!!'),
                    //  trailing: Icon(Icons.local_hospital_sharp),
                  ),
                )),
            SizedBox(
              height: 50,
            ),
            InkWell(
                onTap: () {},
                child: Card(
                  child: ListTile(
                    leading: Icon(Icons.local_hospital_sharp),
                    title: Text('Solicitud 4'),
                    subtitle: Text('Se requiere una Ambulancia Urgente !!!!'),
                    //  trailing: Icon(Icons.local_hospital_sharp),
                  ),
                )),
            SizedBox(
              height: 50,
            ),
            _boton("Ver Mapa"),
            SizedBox(
              height: 50,
            ),
          ],
        ))));
  }

  Widget _boton(String texto) {
    return RaisedButton(
      child: Text(
        texto,
        style: TextStyle(color: Colors.white),
      ),
      color: Colors.red,
      elevation: 20,
      padding: EdgeInsets.all(40),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100.0),
        side: BorderSide(color: Colors.deepOrange),
      ),
      onPressed: () {
        Route route = MaterialPageRoute(builder: (__) => MapPage());
        Navigator.push(context, route);
      },
    );
  }
}
