// ignore_for_file: unused_element, avoid_unnecessary_containers, sort_child_properties_last, avoid_print, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:travels_ositos/pages/bodyDashboard.dart';
import 'package:travels_ositos/theme/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  ThemeMode _themeMode = ThemeMode.light;

  // Funcion para cambiar de tema con el icono de la esquina derecha
  void _toggleTheme(bool isDarkMode) {
    setState(() {
      _themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: _themeMode,
      theme: lightTheme,
      darkTheme: darkTheme,
      home: AnimatedTheme(
        data: _themeMode == ThemeMode.dark ? darkTheme : lightTheme,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        child: _dashboard(context, _toggleTheme, _themeMode),
      ),
    );
  }
}

Widget _dashboard(BuildContext context, void Function(bool) toggleTheme,
    ThemeMode themeMode) {
  void _openGoogleMaps() async {
    // URL para abrir una ubicación específica
    final Uri url = Uri.parse('google.maps://'); // Cambia las coordenadas

    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      // Si Google Maps no está instalado, abre en el navegador
      final Uri webUrl = Uri.parse('https://www.google.com/maps/');
      if (await canLaunchUrl(webUrl)) {
        await launchUrl(webUrl);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Error al abrir Google Maps')));
        print('No se pudo abrir Google Maps.');
      }
    }
  }

  return Scaffold(
    appBar: _appBar(context, themeMode, toggleTheme),
    drawer: _drawer(),
    body: BodyDashboard(),
    floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.greenAccent,
        child: Icon(Icons.map),
        onPressed: _openGoogleMaps),
  );
}

PreferredSizeWidget _appBar(BuildContext context, ThemeMode themeMode,
    void Function(bool) toggleTheme) {
  return AppBar(
    backgroundColor: Colors.transparent,
    actions: [
      IconButton(
          icon: Icon(themeMode == ThemeMode.light
              ? Icons.light_mode
              : Icons.dark_mode),
          onPressed: () {
            toggleTheme(themeMode == ThemeMode.light);
          })
    ],
  );
}

Widget _drawer() {
  return Drawer(
      child: ListView(children: [
    SizedBox(
      height: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(
                'https://img.freepik.com/vector-gratis/foto-cuenta-perfil-mujer_24908-81036.jpg?t=st=1737215405~exp=1737219005~hmac=a24846f26c9ea9eb8e117005eb351c491eb263d97f726592bb2ce57afa4090d7&w=826'),
            radius: 50,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Opciones',
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    ),
    Container(
      padding: EdgeInsets.all(10),
      child: Column(
        spacing: 8,
        children: [
          ListTile(
              title: Text('Actualizar'),
              trailing: Icon(
                Icons.update,
                color: Colors.green,
              ),
              onTap: () {/*Accion para actualizar el apk desde google drive*/}),
          ListTile(
              title: Text('Calendario'),
              trailing: Icon(
                Icons.calendar_today,
                color: Colors.blue,
              ),
              onTap: () {/*Accion para ver el calendario*/}),
          ListTile(
              title: Text('Agenda'),
              trailing: Icon(
                Icons.description_outlined,
                color: Colors.purple,
              ),
              onTap: () {/*Accion par abrir la agenda*/}),
          ListTile(
              title: Text('Notas'),
              trailing: Icon(
                Icons.note,
                color: const Color.fromARGB(255, 233, 118, 30),
              ),
              onTap: () {/*Accion para guardar y escribir notas*/}),
        ],
      ),
    )
  ]));
}
