import 'package:flutter/material.dart';

class TMBRoute extends StatefulWidget {
  const TMBRoute({super.key});

  @override
  State<TMBRoute> createState() => _TMBRouteState();
}

class _TMBRouteState extends State<TMBRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TMB Route'),
      )
    );
  }
}