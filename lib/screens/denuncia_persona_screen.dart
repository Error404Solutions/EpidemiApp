import 'package:flutter/material.dart';
import '../widgets/denuncia_persona_form.dart';

class DenunciaPersonaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Denunciar Persona Contagiada'),
      ),
      body: DenunciaPersonaForm(),
    );
  }
}
