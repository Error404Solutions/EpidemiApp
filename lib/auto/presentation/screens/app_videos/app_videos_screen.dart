import 'package:flutter/material.dart';
import 'package:flutter_application_1/auto/config/theme/app_theme.dart';
import 'package:flutter_application_1/auto/presentation/providers/discover_provider.dart';
import 'package:flutter_application_1/auto/presentation/screens/discover/discover_screen.dart';
import 'package:provider/provider.dart';

class AppVideosScreen extends StatelessWidget {
  static const name = 'videos_screen';
  const AppVideosScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DiscoverProvider()..loadNextPage() ),
      ],
      child: MaterialApp(
        title: 'Videos educativos',
        debugShowCheckedModeBanner: false,
        theme: AppThemeV().getTheme(),
        home: const DiscoverScreen()
      ),
    );
  }
}