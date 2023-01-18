import 'package:flutter/material.dart';
import 'package:preferencias_usuario/screens/screens.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          _DrawerCabecera(),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Menú'),
            onTap: () {
              // Navigator.pop(context); // puede ser una alternativa
              //sobre escribe la ruta
              Navigator.pushNamed(context, HomeScreen.nombreRuta);
            },
          ),
          ListTile(
            leading: const Icon(Icons.people_outline),
            title: const Text('Gente'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.settings_outlined),
            title: const Text('Ajustes'),
            onTap: () {
              Navigator.pushNamed(context, AjustesScreen.nombreRuta);
            },
          ),
        ],
      ),
    );
  }
}

class _DrawerCabecera extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/menu-img.jpg'),
          fit: BoxFit.cover
        )
      ),
      child: Container(),
    );
  }
}