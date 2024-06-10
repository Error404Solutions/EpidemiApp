import 'package:flutter/material.dart';
import 'denuncia_foco_screen.dart';
import 'denuncia_persona_screen.dart';

/*
Este archivo contiene el código para la pantalla DenunciaScreen en una aplicación Flutter.
El propósito de esta pantalla es servir como un punto de entrada para que los usuarios
elijan el tipo de denuncia que desean realizar, ya sea denunciar un foco de infección
o denunciar a una persona contagiada.

Características principales:
- Interfaz simple y clara con dos botones grandes.
- Navegación a pantallas específicas (DenunciaFocoScreen y DenunciaPersonaScreen)
  dependiendo del botón presionado.
- Diseño responsivo que se adapta al tamaño de la pantalla.
- Estilo personalizado para los botones, incluyendo colores, padding, y bordes redondeados.*/

class DenunciaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Elige el tipo de denuncia que deseas realizar'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Contenido principal
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DenunciaFocoScreen()),
                      );
                    },
                    child: Text('Denunciar Foco'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[800], // Color del botón
                      foregroundColor: Colors.white, // Color del texto
                      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                      textStyle: TextStyle(fontSize: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DenunciaPersonaScreen()),
                      );
                    },
                    child: Text('Denunciar Persona Contagiada'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[800], // Color del botón
                      foregroundColor: Colors.white, // Color del texto
                      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                      textStyle: TextStyle(fontSize: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Footer con el icono y el texto
          Container(
            padding: EdgeInsets.all(16.0),
            color: Colors.grey[200],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 8.0),
                Text(
                  'Derechos reservados Error 404',
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
