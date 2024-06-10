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
  /* MenuItem(
      title: 'Botones',
      subTitle: 'Varios',
      link: '/buttons',
      icon: Icons.videocam
    ),

    MenuItem(
      title: 'Tarjetas',
      subTitle: 'contenedor',
      link: '/cards',
      icon: Icons.warning
    ),

    MenuItem(
      title: 'ProgressIndicators',
      subTitle: 'Generales y controlados',
      link: '/progress',
      icon: Icons.refresh_rounded
    ),
    MenuItem(
      title: 'Snackbars y dialogos', 
      subTitle: 'Indicadores en pantalla',
      link: '/snackbars',
      icon: Icons.info_outline
    ), */
    MenuItem(
      title: 'Peligros de la automedicacion',
      subTitle: 'La información proporcionada aquí no es un sustituto del consejo médico profesional.',
      link: '/tutorial',
      icon: Icons.info_outline
    ),
    MenuItem(
      title: 'Videos cortos y educativos',
      subTitle: 'Practicas y uso racional de medicamentos.',
      link: '/videos',
      icon: Icons.info_outline
    ),
    MenuItem(
      title: 'Casos Registrados',
      subTitle: 'Tabla de casos del dengue.',
      link: '/casos',
      icon: Icons.info_outline
    ),
    MenuItem(
      title: 'Informacion Dengue',
      subTitle: 'Portafolio educativo.',
      link: '/info',
      icon: Icons.info_outline
    ),
];
