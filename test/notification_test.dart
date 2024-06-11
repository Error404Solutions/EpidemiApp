import 'dart:io';
import 'package:flutter_test/flutter_test.dart';// Ajusta esto según tu estructura de archivos
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_application_1/auto/domain/entities/push_message.dart';


void main() {
  test('Verificar que el título de la notificación se maneje correctamente', () {
    // Crear un mensaje simulado
    final RemoteMessage message = RemoteMessage(
      messageId: '01718047707603381f71274eef71274ee',
      notification: const RemoteNotification(
        title: 'Los riesgos de la automedicación',
        body: 'Bebe muchos líquidos (agua, sueros orales, jugos naturales) para prevenir la deshidratación.',
        android: AndroidNotification(
          imageUrl: 'https://tukuz.com/wp-content/uploads/2020/12/medtech-global-logo-vector.png',
        ),
        apple: AppleNotification(
          imageUrl: 'https://tukuz.com/wp-content/uploads/2020/12/medtech-global-logo-vector.png',
        ),
      ),
      sentTime: DateTime(2024, 6, 10, 14, 28, 27, 594),
      data: {'hola': 'mundo', 'type': 'chat'},
    );






    // Definir la función _handleRemoteMessage para la prueba
    void _handleRemoteMessage(RemoteMessage message) {
      if (message.notification == null) return;
      final notification = PushMessage(
        messageId: message.messageId?.replaceAll(':', '').replaceAll('%', '') ?? '',
        title: message.notification!.title ?? '',
        body: message.notification!.body ?? '',
        senDate: message.sentTime ?? DateTime.now(),
        data: message.data,
        imageUrl: Platform.isAndroid ? message.notification!.android?.imageUrl : message.notification!.apple?.imageUrl,
      );
      expect(notification.title, 'Los riesgos de la automedicación');
    }

    // Ejecutar la función con el mensaje simulado
    _handleRemoteMessage(message);
  });
}