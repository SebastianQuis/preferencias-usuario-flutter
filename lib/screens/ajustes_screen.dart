import 'package:flutter/material.dart';
import 'package:preferencias_usuario/providers/app_theme_provider.dart';
import 'package:preferencias_usuario/share_preferences/preferences.dart';
import 'package:preferencias_usuario/widgets/drawer_menu.dart';
import 'package:provider/provider.dart';

class AjustesScreen extends StatefulWidget {
  const AjustesScreen({Key? key}) : super(key: key);

  static const String nombreRuta = 'ajustes';

  @override
  State<AjustesScreen> createState() => _AjustesScreenState();
}

class _AjustesScreenState extends State<AjustesScreen> {
  // bool esModoOscuro = false;
  // int genero = 1; // prendido
  // String name = "Emily Gallegos";
  // late String dosLetras;

  // Future<String> letrasAvatar(String nombre) async {
  //   final palabras = name.split(' ');
  //   String dosLetras = "";
  //   for (String palabra in palabras) {
  //     dosLetras += palabra[0];
  //   }
  //   return dosLetras;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Ajustes'),
          actions: const [
            CircleAvatar(
              child: Text(
                'EG',
                style: TextStyle(fontWeight: FontWeight.w800),
              ),
            ),
            SizedBox(
              width: 8,
            ),
          ],
        ),
        drawer: DrawerMenu(),
        body: Padding(
          padding: const EdgeInsets.all(11.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ajustes',
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.w400),
                ),
                const Divider(),
                SwitchListTile.adaptive(
                  //widget se refleja depende del SO
                  value: Preferences.esModoOscuro,
                  title: const Text('Modo oscuro'),
                  onChanged: (value) {
                    Preferences.esModoOscuro = value;

                    final appThemeProvider =
                        Provider.of<AppThemeProvider>(context, listen: false);

                    value
                        ? appThemeProvider.setDarkMode()
                        : appThemeProvider.setLightMode();

                    setState(() {});
                  },
                ),
                const Divider(),
                RadioListTile<int>(
                  value: 1, // valor
                  groupValue: Preferences.genero, // cambia
                  title: const Text('Masculino'),
                  onChanged: (value) {
                    Preferences.genero = value ?? 1; //si es nulo, entonces 1
                    setState(() {});
                  },
                ),
                const Divider(),
                RadioListTile<int>(
                  value: 2,
                  groupValue: Preferences.genero,
                  title: const Text('Femenino'),
                  onChanged: (value) {
                    Preferences.genero = value ?? 2; //si es nulo entonces 2
                    setState(() {});
                  },
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: TextFormField(
                    initialValue: Preferences.nombre,
                    decoration: const InputDecoration(
                        labelText: 'Nombre', helperText: 'Nombre de usuario'),
                    onChanged: (value) {
                      //TODO: Crear IconData en AppBar
                      //TODO: mostrar la 1ra letra apellido y nom
                      //value es el texto que ingresó
                      Preferences.nombre = value;
                      setState(() {});
                    },
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
