import 'package:flutter/material.dart';
import 'package:preferencias_usuario/share_preferences/preferences.dart';
import 'package:preferencias_usuario/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String nombreRuta = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      drawer: const DrawerMenu(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Modo oscuro: ${ Preferences.esModoOscuro }'),
          Divider(),
          Text('Genero: ${ Preferences.genero }'),
          Divider(),
          Text('Nombre de usuario: ${ Preferences.nombre }'),
          Divider(),
        ],
      )
    );
  }
}
