import 'package:flutter/material.dart';
import 'package:flutter_application_1/auto/config/menu/menu_item.dart';
import 'package:flutter_application_1/auto/presentation/blocs/notifications/notifications_bloc.dart';
import 'package:flutter_application_1/auto/presentation/widgets/side_menu.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: context.select(
          ( NotificationsBloc bloc) => Text('${ bloc.state.status }')
        ),

        //const Text('Peligros de la automedicación'),
        actions: [
          IconButton(
            onPressed: () {
              context.read<NotificationsBloc>().requestPermission();
            },
            icon: const Icon(Icons.settings), 
          )
        ],
      ),
      body: const _HomeView(),
      drawer: SideMenu( scaffoldKey: scaffoldKey )
    );
  }
}



class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    final notifications = context.watch<NotificationsBloc>().state.notifications;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Peligros de la automedicación'),
      ),
      body: Column(
        children: [
          const _HomeImage(imageUrl: 'nico/4.png'),
          const Divider(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: appMenuItems.length,
                    itemBuilder: (context, index) {
                      final menuItem = appMenuItems[index];
                      return _CustomListTitle(menuItem: menuItem);
                    },
                  ),
                ),
                const SizedBox(height: 16), // Espacio entre el contenido y Notificaciones
                const Text('Notificaciones', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8), // Espacio entre el título de Notificaciones y la lista
                Expanded(
                  flex: 1, // Ajusta el tamaño de Notificaciones según sea necesario
                  child: ListView.builder(
                    itemCount: notifications.length,
                    itemBuilder: (BuildContext context, int index) {
                      final notification = notifications[index];
                      return ListTile(
                        title: Text(notification.title),
                        subtitle: Text(notification.body),
                        leading: notification.imageUrl != null
                            ? Image.network(notification.imageUrl!)
                            : null,
                      );
                    },
                  ),
                ),
              ],
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
        height: 300, // Adjust image height as needed
        fit: BoxFit.cover, // Adjust image fit as needed
      ),
    );
  }
}

