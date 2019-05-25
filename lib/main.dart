import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_login_php/pages/homeAdmin.dart';
import 'package:http/http.dart' as http;

void main() => runApp(LoginApp());

class LoginApp extends StatelessWidget {

  static const MaterialColor blueMod = const MaterialColor(
    0xFF030D61,
    const <int, Color>{
      50: const Color(0xFF030D61),
      100: const Color(0xFF030D61),
      200: const Color(0xFF030D61),
      300: const Color(0xFF030D61),
      400: const Color(0xFF030D61),
      500: const Color(0xFF030D61),
      600: const Color(0xFF030D61),
      700: const Color(0xFF030D61),
      800: const Color(0xFF030D61),
      900: const Color(0xFF030D61),
    },
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login | User',
      theme: ThemeData(
        primarySwatch:
            blueMod,
            fontFamily: 'balakhani'
      ),
      home: LoginPage(),
      routes: <String, WidgetBuilder>{
        '/homeAdmin': (BuildContext context) => new homeAdmin()
      },
    );
  }
}

class LoginPage extends StatefulWidget{
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }


  Future<List> login(String username, String password) async {
    final response = await http.post("https://gestionjardin.000webhostapp.com/include/flutterAppLogin.php", body: {
      "identificacion": username,
      "password": password,
    });
    var dataUser = json.decode(response.body);
    if(dataUser.length == 0){
      setState(() {
        _showAlertMessagePassAndEmail();
      });
    }else{
      if(dataUser[0]['tipo_usuario'] == "3"){
        Navigator.pushReplacementNamed(context, '/homeAdmin');
      }else{
        _showAlertNoMoreUser();
      }
      setState(() {
        username = dataUser[0]['identificacion'];
      });
    }
    return dataUser;
  }
  
  void _showAlertDialog() {
    showDialog(
        context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Campos vacios."),
          content: new Text("Por favor rectifique los campos."),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Cerrar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ); //AlerDialog
      },
    );
  }

  void _showAlertMessagePassAndEmail() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Algo anda mal."),
          content: new Text("Usuario o contraseña incorrectos."),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Cerrar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ); //AlerDialog
      },
    );
  }

  void _showAlertNoMoreUser(){
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("No hay más usuarios."),
          content: new Text("Demo 1.0"),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Cerrar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ); //AlerDialog
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/2.6,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF030D61),
                    Color(0xFF111F94)
                  ],
                ),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(90),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Spacer(),
                  Align(
                    alignment: Alignment.center,
                    child: Icon(Icons.add_circle,
                    size: 90,
                    color: Colors.white,
                    ),
                  ),
                  Spacer(),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        bottom: 32,
                        left: 32
                      ),
                      child: Text('Inicio',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20
                        ),
                      ),
                    ),
                  ),
                ],
             ),
            ),
            Container(
              height: MediaQuery.of(context).size.height/2.5,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(top: 44),
              child: Column(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width/1.2,
                    height: 40,
                    padding: EdgeInsets.only(
                      top: 4, left: 16, right: 16, bottom: 4
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(50)
                      ),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5
                        )
                      ]
                    ),
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        icon: Icon(Icons.email,
                          color: Colors.grey,
                        ),
                          hintText: 'Email',
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width/1.2,
                    height: 43,
                    margin: EdgeInsets.only(top: 30),
                    padding: EdgeInsets.only(
                        top: 4, left: 16, right: 16, bottom: 4
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                            Radius.circular(50)
                        ),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              blurRadius: 5
                          )
                        ]
                    ),
                    child: TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        icon: Icon(Icons.vpn_key,
                          color: Colors.grey,
                        ),
                        hintText: 'Password',
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 18,
                        right: 32,
                      ),
                      child: Text('¿Olvidaste la contraseña?',
                        style: TextStyle(
                          color: Colors.grey
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  new GestureDetector(
                    onTap: (){
                      if(emailController.text.isEmpty || passwordController.text.isEmpty){
                        _showAlertDialog();
                      }else{
                        login(emailController.text, passwordController.text);
                      }
                    },
                    child: new Container(
                      alignment: Alignment.center,
                      height: 48,
                      width: MediaQuery.of(context).size.width/1.2,
                      decoration: BoxDecoration(

                        gradient: LinearGradient(
                          colors: [
                            Color(0xFF030D61),
                            Color(0xFF111F94)
                          ],
                        ),
                        borderRadius: BorderRadius.all(
                            Radius.circular(50)
                        ),
                      ),
                      child: Text('Iniciar'.toUpperCase(),
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                ]
              ),
             /* margin: EdgeInsets.only(top: MediaQuery.of(context).size.width / 11),*/
            ),
          ],
        ),
      ),

      /*floatingActionButton: FloatingActionButton(
        elevation: ,
          child: Text(
            'Iniciar'.toUpperCase(),
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),
          ),
          onPressed: (){}
      ),*/
    );
  }
}

