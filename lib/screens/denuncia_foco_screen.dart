import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class DenunciaFocoScreen extends StatefulWidget {
  @override
  _DenunciaFocoScreenState createState() => _DenunciaFocoScreenState();
}

class _DenunciaFocoScreenState extends State<DenunciaFocoScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController descripcionController = TextEditingController();
  final TextEditingController ubicacionController = TextEditingController();
  final TextEditingController fechaController = TextEditingController();
  File? _image;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

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
    if (picked != null && picked != DateTime.now())
      setState(() {
        fechaController.text = "${picked.toLocal()}".split(' ')[0];
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

  void _clearFields() {
    descripcionController.clear();
    ubicacionController.clear();
    fechaController.clear();
    setState(() {
      _image = null;
    });
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
      _showDialog("Éxito", "Sus datos se han enviado correctamente");
      _clearFields();
    } else {
      _showDialog("Campos Incompletos", "Por favor complete correctamente todos los campos.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Denunciar Foco'),
      ),
      body: Padding(
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
                      return 'Por favor ingrese una descripción (Máximo 500 caracteres)';
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
      ),
    );
  }
}
