import 'package:flutter/material.dart';
import '../widgets/denuncia_foco_form.dart';

class DenunciaFocoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Denunciar Foco'),
      ),
      body: DenunciaFocoForm(),
    );
  }
}
