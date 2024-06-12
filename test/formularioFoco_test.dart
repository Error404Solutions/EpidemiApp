import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/tendencias_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/main.dart'; // Asegúrate de que el camino sea correcto para tu archivo main.dart
import 'dart:convert';

class MockClient extends http.BaseClient {
  final Map<String, String> headers;
  final String responseBody;
  final int statusCode;

  MockClient({required this.headers, required this.responseBody, required this.statusCode});

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    return http.StreamedResponse(
      Stream.value(utf8.encode(responseBody)),
      statusCode,
      headers: headers,
    );
  }
}

void main() {
  testWidgets('Fetch localidades and display data', (WidgetTester tester) async {
    final client = MockClient(
      headers: {'content-type': 'application/json'},
      responseBody: json.encode([
        {"ubicacion": "Localidad1", "count": 10, "distancia": 5.0},
        {"ubicacion": "Localidad2", "count": 15, "distancia": 10.0}
      ]),
      statusCode: 200,
    );

    await tester.pumpWidget(const MyApp());

    expect(find.text('Tabla de casos de dengue por localidad'), findsOneWidget);

    // Simula la respuesta HTTP
    await tester.runAsync(() async {
      await tester.pumpAndSettle();
    });

    expect(find.text('Localidad1'), findsOneWidget);
    expect(find.text('10'), findsOneWidget);
    expect(find.text('5.0'), findsOneWidget);
    expect(find.text('Localidad2'), findsOneWidget);
    expect(find.text('15'), findsOneWidget);
    expect(find.text('10.0'), findsOneWidget);
  });

  testWidgets('Navigate to TendenciasScreen', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('TENDENCIAS'), findsOneWidget);

    await tester.tap(find.text('TENDENCIAS'));
    await tester.pumpAndSettle();

    // Verifica que la pantalla de Tendencias se ha cargado
    expect(find.byType(TendenciasScreen), findsOneWidget);
  });
}
