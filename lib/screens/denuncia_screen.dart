import 'package:flutter/material.dart';
import 'denuncia_foco_screen.dart';
import 'denuncia_persona_screen.dart';

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
