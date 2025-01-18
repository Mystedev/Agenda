import 'package:flutter/material.dart';
import 'package:travels_ositos/routes/renfeTravel.dart';

class CardRENFE extends StatefulWidget {
  const CardRENFE({super.key});

  @override
  State<CardRENFE> createState() => _CardRENFEState();
}

class _CardRENFEState extends State<CardRENFE> {
  String title = 'Horarios RENFE';

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: const Color.fromARGB(255, 255, 255, 255),
      color: const Color.fromARGB(255, 249, 226, 204),
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
        trailing: Icon(Icons.train,
            size: 30, color: const Color.fromARGB(255, 201, 107, 19)),
        onTap: () {
          // Accion al pulsar el boton directo de la RENFE
          // Navegar a la nueva pantalla mediante una animacion
          Navigator.push(
            context,
            PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 500),
              pageBuilder: (context, animation, secondaryAnimation) =>
                  const RenfeRoute(),
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
