import 'package:flutter/material.dart';

/*
Este archivo contiene el código para el widget DenunciaPersonaForm, que es parte de una aplicación Flutter.
El propósito de este widget es proporcionar un formulario para que los usuarios denuncien a una persona
que ha sido contagiada, posiblemente con una enfermedad infecciosa como COVID-19.

Características principales:
- Formulario con campos para ingresar el nombre, apellido, síntomas y ubicación de la persona contagiada.
- Utiliza un GlobalKey<FormState> para manejar la validación del formulario.
- Campo de fecha interactivo que abre un DatePicker cuando se toca.
- El DatePicker está configurado para permitir fechas desde 2020 hasta el día actual.
- La fecha seleccionada se muestra en el campo de texto.
- Botón "Enviar" que valida el formulario antes de procesar los datos. */

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
