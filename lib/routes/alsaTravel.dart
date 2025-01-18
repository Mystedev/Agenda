import 'package:flutter/material.dart';

class AlsaRoute extends StatefulWidget {
  const AlsaRoute({super.key});

  @override
  State<AlsaRoute> createState() => _AlsaRouteState();
}

class _AlsaRouteState extends State<AlsaRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alsa'),
      )
    );
  }
}