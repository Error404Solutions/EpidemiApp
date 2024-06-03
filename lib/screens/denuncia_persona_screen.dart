import 'package:flutter/material.dart';

class DenunciaPersonaScreen extends StatefulWidget {
  @override
  _DenunciaPersonaScreenState createState() => _DenunciaPersonaScreenState();
}

class _DenunciaPersonaScreenState extends State<DenunciaPersonaScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController apellidoController = TextEditingController();
  final TextEditingController sintomasController = TextEditingController();
  final TextEditingController ubicacionController = TextEditingController();

  DateTime? selectedDate; // Variable to store selected date

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Éxito"),
          content: Text("Sus datos se han enviado correctamente"),
          actions: [
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showIncompleteDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Campos Incompletos"),
          content: Text("Por favor complete correctamente todos los campos."),
          actions: [
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showNameErrorDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Nombre Incorrecto"),
          content: Text("Ingrese un nombre con máximo 100 caracteres."),
          actions: [
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showLastNameErrorDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Apellido Incorrecto"),
          content: Text("Ingrese un apellido con máximo 100 caracteres."),
          actions: [
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showDateErrorDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Fecha Incorrecta"),
          content: Text("Por favor ingresa la fecha actual de la denuncia."),
          actions: [
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _handleSubmit() {
    if (_formKey.currentState!.validate()) {
      // Checking if name length is greater than 100
      if (nombreController.text.length > 100) {
        _showNameErrorDialog();
      }
      // Checking if last name length is greater than 100
      else if (apellidoController.text.length > 100) {
        _showLastNameErrorDialog();
      }
      // Checking if the selected date is not equal to the current date
      else if (_isDateDifferentFromToday(selectedDate)) {
        _showDateErrorDialog();
      } else {
        _formKey.currentState!.save();
        // Aquí puedes hacer lo que necesites con los datos recopilados,
        // como enviarlos a través de una solicitud HTTP.
        _showSuccessDialog();
      }
    } else {
      _showIncompleteDialog();
    }
  }

  // Function to check if the selected date is different from today
  bool _isDateDifferentFromToday(DateTime? date) {
    if (date == null) return true;

    final today = DateTime.now();
    final selectedDate = DateTime(date.year, date.month, date.day);
    return selectedDate != DateTime(today.year, today.month, today.day);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Denunciar Persona Contagiada'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: nombreController,
                decoration: InputDecoration(labelText: 'Nombre'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese un nombre';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: apellidoController,
                decoration: InputDecoration(labelText: 'Apellido'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese un apellido';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: sintomasController,
                decoration: InputDecoration(labelText: 'Síntomas'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese los síntomas';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: ubicacionController,
                decoration: InputDecoration(labelText: 'Ubicación'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese una ubicación';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
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
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _handleSubmit,
                child: Text('Enviar'),
              ),
            ],
          ),
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
