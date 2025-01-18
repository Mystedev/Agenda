// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:travels_ositos/dashboardCards/cardAlsa.dart';
import 'package:travels_ositos/dashboardCards/cardRenfe.dart';
import 'package:travels_ositos/dashboardCards/cardTMB.dart';

class BodyDashboard extends StatefulWidget {
  const BodyDashboard({super.key});

  @override
  State<BodyDashboard> createState() => _BodyDashboardState();
}

class _BodyDashboardState extends State<BodyDashboard> {
  // Variables de los elementos principales del Scaffold
  String titleWelcome = 'What Are You Looking For?';
  String subtitle = 'Encuentra un trayecto o accede a la agenda';

  // Elementos destacados de los trayectos
  List<String> destacados = ['Renfe', 'TMB', 'Alsa'];

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
          SizedBox(
            height: 50, // Limita la altura del ListView horizontal
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: destacados.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: _chip(context, destacados[index], destacados[index]),
                );
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            title: Text(
              'Categorias',
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

// Elementos de la lista horizontal de listas
Widget _chip(BuildContext context, String text, String info) {
  return SizedBox(
    width: 100,
    height: 50,
    child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor:
              WidgetStateProperty.all(const Color.fromARGB(255, 249, 255, 179)),
          foregroundColor: WidgetStateProperty.all(Colors.black),
        ),
        onPressed: () {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(info)));
        },
        child: Text(text)),
  );
}
