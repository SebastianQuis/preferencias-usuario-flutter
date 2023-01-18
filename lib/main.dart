import 'package:flutter/material.dart';
import 'package:preferencias_usuario/providers/app_theme_provider.dart';
import 'package:preferencias_usuario/screens/screens.dart';
import 'package:preferencias_usuario/share_preferences/preferences.dart';
import 'package:provider/provider.dart';

void main() async {
  //iniciando la info de widgets antes de continuar
  WidgetsFlutterBinding.ensureInitialized();

  await Preferences.init();
  
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppThemeProvider(esModoOscuro: Preferences.esModoOscuro))
      ],
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: HomeScreen.nombreRuta,
      routes: {
        HomeScreen.nombreRuta: (_) => const HomeScreen(),
        AjustesScreen.nombreRuta: (_) => const AjustesScreen(),
      },

      theme: Provider.of<AppThemeProvider>(context).themeData
      //Preferences.esModoOscuro ? ThemeData.dark() : ThemeData.light(),
    );
  }
}
