import 'package:flutter/material.dart';
import '../models/localidad_info.dart';

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