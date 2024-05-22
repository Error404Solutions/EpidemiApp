import 'package:flutter/material.dart';
import 'dart:io';

class DenunciaFocoForm extends StatefulWidget {
  @override
  _DenunciaFocoFormState createState() => _DenunciaFocoFormState();
}

class _DenunciaFocoFormState extends State<DenunciaFocoForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Descripción'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese una descripción';
                  }
                  return null;
                },
                onSaved: (value) {
                  // Guarda el valor de la descripción
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Ubicación'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese una ubicación';
                  }
                  return null;
                },
                onSaved: (value) {
                  // Guarda el valor de la ubicación
                },
              ),
              SizedBox(height: 20),
              Text('Ilustración:'),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Procesa los datos del formulario
                  }
                },
                child: Text('Enviar'),
              ),
             ],
        ),
      ),
    );
  }
}
