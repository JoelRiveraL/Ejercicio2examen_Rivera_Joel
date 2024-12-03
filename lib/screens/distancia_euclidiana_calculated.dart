import 'package:examen_rivera_joel/logic/dis_eucl_calculator.dart';
import 'package:flutter/material.dart';

class CalcularDistanciaEuc extends StatefulWidget {
  final int x1;
  final int y1;
  final int x2;
  final int y2;

  const CalcularDistanciaEuc({
    super.key,
    required this.x1,
    required this.y1,
    required this.x2,
    required this.y2,
  });

  @override
  State<CalcularDistanciaEuc> createState() => _CalcularDistanciaEucState();
}

class _CalcularDistanciaEucState extends State<CalcularDistanciaEuc> {
  late DistanceCalculator distanceCalculator;

  @override
  void initState() {
    super.initState();
    distanceCalculator = DistanceCalculator(distance: 0.0)
        .calculateDistance(widget.x1, widget.y1, widget.x2, widget.y2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calcular Distancia Euclidiana'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Coordenadas:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text('Punto 1: (${widget.x1}, ${widget.y1})',
                style: const TextStyle(fontSize: 18)),
            Text('Punto 2: (${widget.x2}, ${widget.y2})',
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            const Text(
              'Distancia Euclidiana:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              distanceCalculator.distance.toStringAsFixed(2),
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}

