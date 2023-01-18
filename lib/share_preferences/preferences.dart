import 'package:shared_preferences/shared_preferences.dart';

// ALMACENAR FISICAMENTE EN EL DISPOSITIVO VALORES ANTES DE CARGAR LA APLICACION

class Preferences {
  // todo sea estatico para elaborar antes de correr la app
  static late SharedPreferences _prefs;

  static String _nombre = '';
  static bool _esModoOscuro = false;
  static int _genero = 1;

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
    _prefs.clear();
  }

  static String get nombre {
    return _prefs.getString('nombre') ?? _nombre;
  }

  static set nombre(String value) {
    _nombre = value;
    _prefs.setString('nombre', value);
  }

  static bool get esModoOscuro {
    return _prefs.getBool('esModoOscuro') ?? _esModoOscuro;
  }

  static set esModoOscuro(bool value) {
    _esModoOscuro = value;
    _prefs.setBool('esModoOscuro', value);
  }

  static int get genero {
    return _prefs.getInt('genero') ?? _genero;
  }

  static set genero(int value) {
    _genero = value;
    _prefs.setInt('genero', value);
  }
}
