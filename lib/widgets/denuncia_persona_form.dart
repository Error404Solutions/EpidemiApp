import 'package:flutter/material.dart';

class DenunciaPersonaForm extends StatefulWidget {
  @override
  _DenunciaPersonaFormState createState() => _DenunciaPersonaFormState();
}

class _DenunciaPersonaFormState extends State<DenunciaPersonaForm> {
  final _formKey = GlobalKey<FormState>();
  DateTime? selectedDate; // Variable to store selected date

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
            GestureDetector(
              onTap: () {
                _selectDate(context);
              },
              child: AbsorbPointer(
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Fecha del Contagio'),
                  controller: TextEditingController(text: selectedDate != null ? selectedDate.toString() : ''),
                ),
              ),
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

  // Function to open date picker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }
}
