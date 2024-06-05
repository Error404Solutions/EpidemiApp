import 'package:flutter/material.dart';
import 'package:flutter_application_1/auto/config/menu/menu_item.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Peligros de la automedicación'),
      ),
      body: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* appBar: AppBar(
        title: const Text('Peligros de la automedicación'),
      ), */
      body: Column( // Use a Column for stacking
        children: [
          const _HomeImage(imageUrl: 'nico/4.png'), // Replace with your image path
          const Divider(), // Optional divider between image and list
          Expanded( // Use Expanded for remaining space
            child: ListView.builder(
              itemCount: appMenuItems.length,
              itemBuilder: (context, index) {
                final menuItem = appMenuItems[index];
                return _CustomListTitle(menuItem: menuItem);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomListTitle extends StatelessWidget {
  const _CustomListTitle({
    required this.menuItem,
  });

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ListTile(
      leading: Icon(menuItem.icon, color: colors.primary),
      trailing: Icon(Icons.arrow_forward_ios_rounded, color: colors.primary),
      title: Text(menuItem.title),
      subtitle: Text(menuItem.subTitle),
      onTap: () {
        //Navigator.of(context).push(
        //  MaterialPageRoute(
        //    builder: (context) => const ButtonsScreens(),
        //  ),
        //);
        context.push(menuItem.link);
        //context.pushNamed(CardsScreen.name);
      },
    );
  }
}

class _HomeImage extends StatelessWidget {
  final String imageUrl; // Assuming menuItem has imageUrl

  const _HomeImage({
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0), // Adjust padding as needed
      child: Image.asset(
        imageUrl,
        width: double.infinity, // Match screen width
        height: 400, // Adjust image height as needed
        fit: BoxFit.cover, // Adjust image fit as needed
      ),
    );
  }
}
