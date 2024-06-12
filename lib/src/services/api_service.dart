import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  // Aquí defines la URL base para tu API
  final String baseUrl;

  ApiService(this.baseUrl);

  // Método para crear denunciaF
  Future<void> createDenunciaF(Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/denunciaF'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(data),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to create denunciaF');
    }
  }

  // Método para listar denunciaF
  Future<List<dynamic>> listarDenunciasF() async {
    final response = await http.get(Uri.parse('$baseUrl/api/denunciaFoco'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load denunciaF');
    }
  }

  // Método para listar denuncias por ubicación
  Future<List<dynamic>> listarDenunciasUbic() async {
    final response = await http.get(Uri.parse('$baseUrl/api/denunciaFocoUbicacion'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load denunciaFocoUbicacion');
    }
  }

  // Método para obtener denuncias por ubicación específica
  Future<List<dynamic>> obtenerFocosUbicacion(String ubicacionName) async {
    final response = await http.get(Uri.parse('$baseUrl/api/denunciaF/$ubicacionName'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load focos for ubicacion $ubicacionName');
    }
  }

  // Método para crear denunciaP
  Future<void> createDenunciaP(Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/denunciaP'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(data),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to create denunciaP');
    }
  }

  // Método para listar denunciaP
  Future<List<dynamic>> listarDenunciasP() async {
    final response = await http.get(Uri.parse('$baseUrl/api/denunciaPersona'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load denunciaP');
    }
  }

  // Método para listar denuncias de potenciales por ubicación
  Future<List<dynamic>> listarDenunciasPoUbic() async {
    final response = await http.get(Uri.parse('$baseUrl/api/denunciaPotencialUbicacion'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load denunciaPotencialUbicacion');
    }
  }

  // Método para obtener denuncias de personas por ubicación específica
  Future<List<dynamic>> obtenerDenunciaPersonasUbicacion(String ubicacionName) async {
    final response = await http.get(Uri.parse('$baseUrl/api/denunciaPersona/$ubicacionName'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load personas for ubicacion $ubicacionName');
    }
  }
}
