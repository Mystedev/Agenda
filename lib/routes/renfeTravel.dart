import 'package:flutter/material.dart';

class RenfeRoute extends StatefulWidget {
  const RenfeRoute({super.key});

  @override
  State<RenfeRoute> createState() => _RenfeRouteState();
}

class _RenfeRouteState extends State<RenfeRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Renfe Rodalies'),
      )
    );
  }
}