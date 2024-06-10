import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'main_denuncia.dart' as main_denuncia;
import 'src/informacion_dengue.dart';
import 'src/casos_reportados.dart';
import 'package:flutter_application_1/auto/config/theme/app_theme.dart';
import 'package:flutter_application_1/auto/config/router/app_router.dart';
import 'package:flutter_application_1/auto/presentation/blocs/notifications/notifications_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {

   WidgetsFlutterBinding.ensureInitialized();
   FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
   await NotificationsBloc.initializeFCM();

  runApp(
    //const MyApp()
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => NotificationsBloc() )
      ], 
      child: const MyApp() )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: 0).getTheme(),
      
    );
  }
}
