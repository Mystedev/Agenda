import 'package:flutter/material.dart';
import 'package:travels_ositos/routes/alsaTravel.dart';

class CardALSA extends StatefulWidget {
  const CardALSA({super.key});

  @override
  State<CardALSA> createState() => _CardALSAState();
}

class _CardALSAState extends State<CardALSA> {
  String title = 'Horarios ALSA';
  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: const Color.fromARGB(255, 255, 255, 255),
      color: const Color.fromARGB(255, 185, 212, 249),
      elevation: 5,
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(color: Colors.black),
        ),
        subtitle: Text(
          'Acceder a horarios rapidamente',
          style: TextStyle(color: const Color.fromARGB(255, 94, 94, 94)),
        ),
        trailing: Icon(Icons.bus_alert_sharp,
            size: 30, color: const Color.fromARGB(255, 19, 137, 201)),
        onTap: () {
          // Accion al pulsar el boton directo de la RENFE
          // Navegar a la nueva pantalla
          Navigator.push(
            context,
            PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 500),
              pageBuilder: (context, animation, secondaryAnimation) =>
                  const AlsaRoute(),
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
        },
      ),
    );
  }
}
