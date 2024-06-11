import 'package:flutter_application_1/auto/presentation/screens/screens.dart';
import 'package:flutter_application_1/src/casos_reportados.dart';
import 'package:flutter_application_1/src/informacion_dengue.dart';
import 'package:go_router/go_router.dart';

// GoRouter configuration
final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/buttons',
      name: ButtonsScreens.name,
      builder: (context, state) => const ButtonsScreens(),
    ),
    GoRoute(
      path: '/progress',
      name: ProgressScreen.name,
      builder: (context, state) => const ProgressScreen(),
    ),
    GoRoute(
      path: '/tutorial',
      name: AppTutorialScreen.name,
      builder: (context, state) => const AppTutorialScreen(),
    ),
    GoRoute(
      path: '/videos',
      name: AppVideosScreen.name,
      builder: (context, state) => const AppVideosScreen(),
    ),
    GoRoute(
      path: '/casos',
      name: MyApp.name,
      builder: (context, state) => const MyApp(),
    ),
    GoRoute(
      path: '/info',
      name: InformacionDengue.name,
      builder: (context, state) => const InformacionDengue(),
    ),
  ],
);
