import 'package:flutter/material.dart';
import 'package:travels_ositos/routes/tmbTravel.dart';

class CardTMB extends StatefulWidget {
  const CardTMB({super.key});

  @override
  State<CardTMB> createState() => _CardTMBState();
}

class _CardTMBState extends State<CardTMB> {
  String title = 'Horarios TMB';

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: const Color.fromARGB(255, 245, 200, 200),
      color: const Color.fromARGB(255, 252, 198, 198),
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
        trailing: Icon(Icons.subway,
            size: 30, color: const Color.fromARGB(255, 201, 19, 19)),
        onTap: () {
          // Accion al pulsar el boton directo de la RENFE
          // Navegar a la nueva pantalla
      Navigator.push(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 500),
          pageBuilder: (context, animation, secondaryAnimation) =>
              const TMBRoute(),
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
