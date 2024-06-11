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

//Menu principal de la aplicacion utilizando la clase MenuItem
const appMenuItems = <MenuItem>[
  MenuItem(
      title: 'Peligros de la automedicacion',
      subTitle:
          'La información proporcionada aquí no es un sustituto del consejo médico profesional.',
      link: '/tutorial',
      icon: Icons.info_outline),
  MenuItem(
      title: 'Videos cortos y educativos',
      subTitle: 'Practicas y uso racional de medicamentos.',
      link: '/videos',
      icon: Icons.info_outline),
  MenuItem(
      title: 'Casos Registrados',
      subTitle: 'Tabla de casos del dengue.',
      link: '/casos',
      icon: Icons.info_outline),
  MenuItem(
      title: 'Informacion Dengue',
      subTitle: 'Portafolio educativo.',
      link: '/info',
      icon: Icons.info_outline),
];
