import 'package:flutter/material.dart';

class DenunciaPersonaForm extends StatefulWidget {
  @override
  _DenunciaPersonaFormState createState() => _DenunciaPersonaFormState();
}

class _DenunciaPersonaFormState extends State<DenunciaPersonaForm> {
  final _formKey = GlobalKey<FormState>();
  // Variables to store form data

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Nombre de la Persona Contagiada'),
              // Add validators and onSaved methods
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Apellido de la Persona Contagiada'),
              // Add validators and onSaved methods
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Síntomas'),
              // Add validators and onSaved methods
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Ubicación'),
              // Add validators and onSaved methods
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // Process data
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
