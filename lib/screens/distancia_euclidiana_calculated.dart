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
        title: const Text(
          'Calcular Distancia',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 58, 183, 64),
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 68, 183, 58),
              Color.fromARGB(255, 64, 76, 251)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    spreadRadius: 5,
                  ),
                ],
              ),
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Resultado del Cálculo',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 73, 183, 58),
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildInfoText('Punto 1:', '(${widget.x1}, ${widget.y1})'),
                  const SizedBox(height: 10),
                  _buildInfoText('Punto 2:', '(${widget.x2}, ${widget.y2})'),
                  const SizedBox(height: 20),
                  const Text(
                    'Distancia Euclidiana',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 58, 183, 64),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    distanceCalculator.distance.toStringAsFixed(2),
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 64, 76, 251),
                    ),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(255, 25, 134, 43)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                      padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 15),
                      ),
                    ),
                    child: const Text(
                      'Regresar',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoText(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 73, 183, 58),
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            color: Color.fromARGB(255, 64, 76, 251),
          ),
        ),
      ],
    );
  }
}

