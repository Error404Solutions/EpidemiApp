import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem(
      {required this.title,
      required this.subTitle,
      required this.link,
      required this.icon});
}


const appMenuItems = <MenuItem>[
  MenuItem(
      title: 'Botones',
      subTitle: 'Varios',
      link: '/buttons',
      icon: Icons.videocam
    ),

    MenuItem(
      title: 'Tarjetas',
      subTitle: 'contenedor',
      link: '/card',
      icon: Icons.warning
    ),
];
