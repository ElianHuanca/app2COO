import 'package:flutter/material.dart';
import 'package:proyectosig/providers/providers.dart';
import 'package:proyectosig/src/pages/login_page.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final registerForm = Provider.of<RegisterFormProvider>(context);
    return Scaffold(
      body: Stack(
        children: [_crearFondo(context), _loginForm(context)],
        
      ),
    );
  }
  
  Widget _loginForm(BuildContext context) {
    //final bloc = Provider.of(context);
       
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SafeArea(
            child: Container(
              height: 180.0,
            ),
          ),
          Container(
            width: size.width * 0.85,
            margin: EdgeInsets.symmetric(vertical: 30.0),
            padding: EdgeInsets.symmetric(vertical: 50.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 3.0,
                      offset: Offset(0.0, 5.0),
                      spreadRadius: 3.0)
                ]),
            child: Column(
              children: <Widget>[
                Text('Registro del Personal Encargado',
                    style: TextStyle(fontSize: 20.0)),
                SizedBox(height: 30.0),
                _crearNombre(),
                SizedBox(height: 30.0),
                _crearEmail(),
                SizedBox(height: 30.0),
                _crearPassword(),
                SizedBox(height: 30.0),
                _crearTelefono(),
                SizedBox(height: 30.0),
                _crearEspecialidad(),
                SizedBox(height: 30.0),
                _crearGrupo(),
                SizedBox(height: 30.0),
                _crearCargo(),
                SizedBox(height: 60.0),
                _crearBoton(context),
                
              ],
            ),
          ),
          Text('Estás a punto de crear una cuenta nueva'),
          SizedBox(height: 100.0)
        ],
      ),
    );
  }

  Widget _crearNombre() {
    var registerForm;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          icon: Icon(Icons.accessibility, color: Colors.deepPurple),
          hintText: 'ingrese su nombre completo...',
          labelText: 'Nombre Completo',
        ),
        onChanged: ( value ) => registerForm.nombre=value,
      ),
    );
  }

  Widget _crearEmail() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          icon: Icon(Icons.alternate_email, color: Colors.deepPurple),
          hintText: 'ejemplo@correo.com',
          labelText: 'Correo electrónico',
        ),
      ),
    );
  }

  Widget _crearTelefono() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          icon: Icon(Icons.phone_android, color: Colors.deepPurple),
          hintText: 'ingrese su nro de teléfono...',
          labelText: 'Número de teléfono',
        ),
      ),
    );
  }

  Widget _crearEspecialidad() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          icon: Icon(Icons.api, color: Colors.deepPurple),
          hintText: 'indique su especialidad...',
          labelText: 'Especialidad',
        ),
      ),
    );
  }

  Widget _crearGrupo() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          icon: Icon(Icons.group, color: Colors.deepPurple),
          hintText: 'indique a que grupo pertenece...',
          labelText: 'Grupo',
        ),
      ),
    );
  }

  Widget _crearCargo() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          icon: Icon(Icons.contact_page_rounded, color: Colors.deepPurple),
          hintText: 'indique el cargo que ocupa...',
          labelText: 'Cargo',
        ),
      ),
    );
  }

  Widget _crearPassword() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
          icon: Icon(Icons.lock_outline, color: Colors.deepPurple),
          hintText: 'ingrese una contraseña...',
          labelText: 'Contraseña',
        ),
      ),
    );
  }

  Widget _crearBoton(context) {
    return RaisedButton(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
        child: Text('Registrar'),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      elevation: 0.0,
      color: Colors.deepPurple,
      textColor: Colors.white,
      onPressed: () {
        Route route = MaterialPageRoute(builder: (__) => LoginPage());
        Navigator.push(context, route);
      },
    );
  }

  Widget _crearFondo(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final fondoModaro = Container(
      height: size.height * 0.4,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: <Color>[
        Color.fromRGBO(63, 63, 156, 1.0),
        Color.fromRGBO(90, 70, 178, 1.0)
      ])),
    );

    final circulo = Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: Color.fromRGBO(255, 255, 255, 0.05)),
    );

    return Stack(
      children: <Widget>[
        fondoModaro,
        Positioned(top: 90.0, left: 30.0, child: circulo),
        Positioned(top: -40.0, right: -30.0, child: circulo),
        Positioned(bottom: -50.0, right: -10.0, child: circulo),
        Positioned(bottom: 120.0, right: 20.0, child: circulo),
        Positioned(bottom: -50.0, left: -20.0, child: circulo),
        Container(
          padding: EdgeInsets.only(top: 80.0),
          child: Column(
            children: <Widget>[
              Icon(Icons.person_pin_circle, color: Colors.white, size: 100.0),
              SizedBox(height: 10.0, width: double.infinity),
              Text('Centro de Control de Operaciones',
                  style: TextStyle(color: Colors.white, fontSize: 25.0))
            ],
          ),
        )
      ],
    );
  }
}
