import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1/auto/domain/entities/push_message.dart';
import 'package:flutter_application_1/firebase_options.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

part 'notifications_event.dart';
part 'notifications_state.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");
}

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationsBloc() : super(const NotificationsState()) {

    on<NotificationStatusChanged>(_notificationStatusChanged);
    on<NotificationReceived>(_onPushMessageReceived);
    
    _initialStatusCheck();
    
    _onForegroundMessage();

  }

  static Future <void> initializeFCM() async {
    await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  void _notificationStatusChanged( NotificationStatusChanged event, Emitter<NotificationsState> emit ) {
    emit(
      state.copyWith(
        status: event.status
      )
    );
    _getFCMToken();
  }
  void _onPushMessageReceived( NotificationReceived event, Emitter<NotificationsState> emit ) {
    emit(
      state.copyWith(
        notifications: [
          event.pushMessage, ...state.notifications
        ]
      )
    );
    //_getFCMToken();
  }

  void _initialStatusCheck() async {
    final settings = await messaging.getNotificationSettings();
    add(NotificationStatusChanged(settings.authorizationStatus));
  }

  void _getFCMToken() async {
    //final settings = await messaging.getNotificationSettings();
    if ( state.status != AuthorizationStatus.authorized ) return;

    final token = await messaging.getToken();
    print(token);
  }


  void _handleRemoteMessage( RemoteMessage message ) {
    if (message.notification == null) return; 
    final notification = PushMessage(
      messageId: message.messageId
        ?.replaceAll(':', '').replaceAll('%', '')
        ?? '',
      title: message.notification!.title ?? '', 
      body: message.notification!.body ?? '', 
      senDate: message.sentTime ?? DateTime.now(),
      data: message.data,
      imageUrl: Platform.isAndroid
        ? message.notification!.android?.imageUrl
        : message.notification!.apple?.imageUrl
    );

    //print(notification);
    add(NotificationReceived(notification));

  }

  void _onForegroundMessage() {
    FirebaseMessaging.onMessage.listen(_handleRemoteMessage);
  }

  void requestPermission() async {

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: true,
      provisional: false,
      sound: true,
    );

    add(NotificationStatusChanged(settings.authorizationStatus));
    
  }
}
