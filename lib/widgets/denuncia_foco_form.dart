import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class DenunciaFocoForm extends StatefulWidget {
  @override
  _DenunciaFocoFormState createState() => _DenunciaFocoFormState();
}

class _DenunciaFocoFormState extends State<DenunciaFocoForm> {
  final _formKey = GlobalKey<FormState>();
  File? _image;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

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
