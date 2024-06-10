import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

/*
Este archivo contiene el código para el widget DenunciaFocoForm, que es parte de una aplicación Flutter.
El propósito de este widget es proporcionar un formulario interactivo para que los usuarios
denuncien un "foco" de algún problema (posiblemente un foco de infección o un área problemática).

Características principales:
- Formulario con campos para ingresar una descripción, ubicación, y fecha.
- Validación de campos para asegurar que todos estén completos.
- Límite de 500 caracteres para el campo de descripción.
- Selector de fecha que utiliza el widget showDatePicker de Flutter.
- Función para tomar una foto usando la cámara del dispositivo (usando el paquete image_picker).
- Visualización de la imagen capturada directamente en el formulario.
- Diálogos para mostrar mensajes de éxito o errores (como descripción demasiado larga o fecha incorrecta).
- Función para limpiar todos los campos después de un envío exitoso. */

class DenunciaFocoForm extends StatefulWidget {
  @override
  _DenunciaFocoFormState createState() => _DenunciaFocoFormState();
}

class _DenunciaFocoFormState extends State<DenunciaFocoForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController descripcionController = TextEditingController();
  final TextEditingController ubicacionController = TextEditingController();
  final TextEditingController fechaController = TextEditingController();
  File? _image;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickerImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        fechaController.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }

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

  void _clearFields() {
    descripcionController.clear();
    ubicacionController.clear();
    fechaController.clear();
    setState(() {
      _image = null;
    });
  }

  void _showDialog(String title, String content) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(content),
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
      String descripcion = descripcionController.text;
      DateTime fechaActual = DateTime.now();
      String fechaActualStr = "${fechaActual.toLocal()}".split(' ')[0];
      String fechaIngresada = fechaController.text;

      if (descripcion.length > 500) {
        _showDialog("Descripción incorrecta", "Ingresa máximo 500 caracteres");
        return;
      }

      if (fechaIngresada != fechaActualStr) {
        _showDialog("Fecha incorrecta", "Por favor ingresa la fecha actual de la denuncia");
        return;
      }

      _formKey.currentState!.save();
      _showSuccessDialog();
      _clearFields();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Scrollbar(
          thumbVisibility: true,
          child: ListView(
            children: [
              TextFormField(
                controller: descripcionController,
                decoration: InputDecoration(labelText: 'Descripción'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese una descripción';
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
              TextFormField(
                controller: fechaController,
                decoration: InputDecoration(
                  labelText: 'Fecha',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.calendar_today),
                    onPressed: () => _selectDate(context),
                  ),
                ),
                readOnly: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor seleccione una fecha';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Text('Ilustración:'),
              _image == null
                  ? Text('No se ha seleccionado una imagen.')
                  : Image.file(_image!),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: _pickImage,
                child: Text('Tomar Foto'),
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

}
