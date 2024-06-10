import 'package:flutter/material.dart';
import '../models/localidad_info.dart';

/*
Este archivo contiene el código para el widget LocalidadTable, un componente reutilizable
en una aplicación Flutter. El propósito de este widget es mostrar información detallada
sobre una localidad específica en un formato de tabla.

Características principales:
- Toma un objeto LocalidadInfo como parámetro requerido, lo que lo hace flexible y reutilizable.
- Utiliza el widget Table de Flutter para crear una tabla simple y legible.
- La tabla tiene tres columnas: Localidad (nombre), Casos (número de casos), y Distancia.
- El diseño de la tabla incluye bordes y padding para mejorar la legibilidad. */

class LocalidadTable extends StatelessWidget {
  final LocalidadInfo localidad;

  LocalidadTable({required this.localidad});

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(color: Colors.grey),
      children: [
        TableRow(
          children: [
            TableCell(child: Padding(padding: EdgeInsets.all(8), child: Text('Localidad', style: TextStyle(fontWeight: FontWeight.bold)))),
            TableCell(child: Padding(padding: EdgeInsets.all(8), child: Text('Casos', style: TextStyle(fontWeight: FontWeight.bold)))),
            TableCell(child: Padding(padding: EdgeInsets.all(8), child: Text('Distancia', style: TextStyle(fontWeight: FontWeight.bold)))),
          ],
        ),
        TableRow(
          children: [
            TableCell(child: Padding(padding: EdgeInsets.all(8), child: Text(localidad.nombre))),
            TableCell(child: Padding(padding: EdgeInsets.all(8), child: Text(localidad.casos.toString()))),
            TableCell(child: Padding(padding: EdgeInsets.all(8), child: Text(localidad.distancia))),
          ],
        ),
      ],
    );
  }
}