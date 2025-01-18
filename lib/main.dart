// ignore_for_file: sized_box_for_whitespace, avoid_unnecessary_containers, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:travels_ositos/pages/mainDashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travels',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _scale = 1.0; // Tamaño inicial del botón

  void _onButtonPressed() {
    setState(() {
      _scale = 0.9; // Reducir tamaño
    });

    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        _scale = 1.0; // Volver al tamaño original
      });
      // Navegar a la nueva pantalla
      Navigator.push(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 500),
          pageBuilder: (context, animation, secondaryAnimation) =>
              const DashboardScreen(),
          transitionsBuilder:
              (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0.0);
            const end = Offset.zero;
            const curve = Curves.easeInOut;

            var tween = Tween(begin: begin, end: end)
                .chain(CurveTween(curve: curve));
            var offsetAnimation = animation.drive(tween);

            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Imagen de fondo
          Positioned.fill(
            child: Image.network(
              'https://i.pinimg.com/736x/22/ad/2c/22ad2c5167e8392537f25060663ecc75.jpg',
              fit: BoxFit.cover, // Hace que la imagen llene todo el espacio
            ),
          ),

          // Widgets superpuestos
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Texto centrado
                const Text(
                  'Bienvenida a nuestra App',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 60.0,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                const Text(
                  'Acceso al dashboard',
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Color.fromARGB(255, 65, 65, 65),
                  ),
                ),
                const SizedBox(height: 50.0),

                // Botón animado
                AnimatedScale(
                  scale: _scale, // Escala del botón
                  duration: const Duration(milliseconds: 100),
                  child: ElevatedButton.icon(
                    onPressed: _onButtonPressed,
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(200.0, 60.0),
                      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    ),
                    icon: const Icon(
                      Icons.call_made_rounded,
                      color: Colors.white,
                    ),
                    label: const Text(
                      'Acceder',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
