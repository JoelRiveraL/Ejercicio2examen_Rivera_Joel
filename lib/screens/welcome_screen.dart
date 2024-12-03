import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'insert_data_screen.dart';

class PantallaBienvenida extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bienvenido a la aplicación"),
        backgroundColor: const Color.fromARGB(255, 62, 183, 58),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Hola !! \n Bienvenido a la aplicación de calculo de la distancia euclidiana',
            style: TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context) => InsertdataScreen()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 62, 183, 58),
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
                child: const Text("Insertar datos")
            )

          ],
        ),
      ),
    );
  }

}