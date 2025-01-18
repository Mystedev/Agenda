// ignore_for_file: avoid_unnecessary_containers, unused_element

import 'package:flutter/material.dart';
import 'package:travels_ositos/dashboardCards/cardAlsa.dart';
import 'package:travels_ositos/dashboardCards/cardRenfe.dart';
import 'package:travels_ositos/dashboardCards/cardTMB.dart';
import 'package:travels_ositos/link/link.dart';
import 'package:url_launcher/url_launcher.dart';

class BodyDashboard extends StatefulWidget {
  const BodyDashboard({super.key});

  @override
  State<BodyDashboard> createState() => _BodyDashboardState();
}

class _BodyDashboardState extends State<BodyDashboard> {
  // URLs de las páginas
  final String tarifasUrl =
      'https://rodalies.gencat.cat/es/tarifes/noves-tarifes-2025/';
  final String horariosUrl =
      'https://www.tmb.cat/es/tarifas-metro-bus-barcelona';

  // Variables de los elementos principales del Scaffold
  String titleWelcome = 'What Are You Looking For?';
  String subtitle = 'Encuentra un trayecto o accede a la agenda';

  // Elementos destacados de los trayectos
  List<String> destacados = ['Renfe', 'TMB', 'Alsa'];

  // Elementos de texto de la pantalla
  String bonos = 'Bonos';
  String verBonos = 'Ver bonos';
  String renfeName = 'Renfe';
  String tmbname = 'TMB';
  String categorias = 'Categorias';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18.0),
      child: ListView(
        children: [
          ListTile(
            title: Text(
              titleWelcome,
              style: const TextStyle(fontSize: 40),
            ),
            subtitle: Text(subtitle),
          ),
          const SizedBox(height: 20),
          ListTile(
              title: Text(bonos),
              subtitle: Text(verBonos),
              trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                ElevatedButton.icon(
                    onPressed: () {
                      // Funcion que abre un enlace directo a los horarios oficiales
                      Link.LaunchUrl(tarifasUrl);
                    },
                    style: ButtonStyle(
                      minimumSize: WidgetStatePropertyAll(Size(100, 50)),
                      backgroundColor:
                          WidgetStateProperty.all(Colors.deepOrangeAccent),
                    ),
                    label: Text(renfeName)),
                SizedBox(
                  width: 15,
                ),
                ElevatedButton.icon(
                    onPressed: () {
                      // Funcion abre un enlace directo a horarios oficiales
                      Link.LaunchUrl(horariosUrl);
                    },
                    style: ButtonStyle(
                      minimumSize: WidgetStatePropertyAll(Size(100, 50)),
                      backgroundColor:
                          WidgetStateProperty.all(Colors.redAccent),
                    ),
                    label: Text(tmbname))
              ])),
          SizedBox(
            height: 20,
          ),
          ListTile(
            title: Text(
              categorias,
              style: TextStyle(fontSize: 25),
            ),
            trailing: Icon(
              Icons.category,
              size: 30,
              color: const Color.fromARGB(255, 43, 92, 160),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          CardRENFE(), // Tarjeta directa a los horarios de la RENFE
          SizedBox(
            height: 20,
          ),
          CardTMB(), // Tarjeta directa a los horarios  de TMB
          SizedBox(
            height: 20,
          ),
          CardALSA(), // Tarjeta directa a los horarios de ALSA
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
