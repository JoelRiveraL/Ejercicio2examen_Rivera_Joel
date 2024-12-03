import 'package:flutter/material.dart';
import 'distancia_euclidiana_calculated.dart';

class InsertdataScreen extends StatelessWidget {
  // Declarar controladores
  final TextEditingController _point1X1 = TextEditingController();
  final TextEditingController _point1Y1 = TextEditingController();
  final TextEditingController _point2X2 = TextEditingController();
  final TextEditingController _point2Y2 = TextEditingController();

  InsertdataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Insertar Datos",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 58, 183, 64),
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 68, 183, 58), Color.fromARGB(255, 64, 76, 251)],
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
                    "Ingrese las coordenadas",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 73, 183, 58),
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildInputField("Punto 1 X1", _point1X1),
                  const SizedBox(height: 15),
                  _buildInputField("Punto 1 Y1", _point1Y1),
                  const SizedBox(height: 15),
                  _buildInputField("Punto 2 X2", _point2X2),
                  const SizedBox(height: 15),
                  _buildInputField("Punto 2 Y2", _point2Y2),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      int x1 = int.tryParse(_point1X1.text.trim()) ?? 0;
                      int y1 = int.tryParse(_point1Y1.text.trim()) ?? 0;
                      int x2 = int.tryParse(_point2X2.text.trim()) ?? 0;
                      int y2 = int.tryParse(_point2Y2.text.trim()) ?? 0;

                      if (x1 > 0 && y1 > 0 && x2 > 0 && y2 > 0) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CalcularDistanciaEuc(
                              x1: x1,
                              y1: y1,
                              x2: x2,
                              y2: y2,
                            ),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Por favor ingrese datos correctos"),
                          ),
                        );
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(const Color.fromARGB(255, 25, 134, 43)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                      padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 15),
                      ),
                    ),
                    child: const Text(
                      "Calcular Distancia",
                      style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 255, 255, 255)),
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

  Widget _buildInputField(String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Color.fromARGB(255, 58, 183, 64)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Color.fromARGB(255, 58, 183, 64)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Color.fromARGB(255, 64, 83, 251), width: 2),
        ),
        prefixIcon: const Icon(
          Icons.numbers,
          color: Color.fromARGB(255, 58, 183, 64),
        ),
        filled: true,
        fillColor: const Color.fromARGB(255, 230, 245, 229),
      ),
    );
  }
}
