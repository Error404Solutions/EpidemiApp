import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(this.title, this.caption, this.imageUrl);
}

final slides = <SlideInfo>[
  SlideInfo(
      '¿Qué es la automedicación?',
      'Es tomar medicamentos por iniciativa propia sin ningun tipo de seguimiento por parte de profesionales santinarios',
      'nico/1.png'),
  SlideInfo(
      'Los medicamentos sin receta pueden producir problemas para la salud',
      'Cualquier medicamento puede ser perjudicial para la salud en determinadas situaciones, tambien los que puedan obtenerse sin receta.',
      'nico/2.png'),
  SlideInfo(
      'Medicamentos prohibidos',
      'Ácido acetilsalicílico (aspirina): Puede aumentar el riesgo de sangrado. Antiinflamatorios no esteroides (AINEs): Ibuprofeno, naproxeno, diclofenaco. Pueden aumentar el riesgo de sangrado y empeorar la enfermedad. ',
      'nico/3.png'),
];

class AppTutorialScreen extends StatefulWidget {
  static const name = 'tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
              
              physics: const BouncingScrollPhysics(),
              children: slides
                  .map((slideData) => _Slide(
                      title: slideData.title,
                      caption: slideData.caption,
                      imageUrl: slideData.imageUrl))
                  .toList()
          ),
          
          Positioned(
            right: 20,
            top: 50,
            child: TextButton(
              child: const Text('Salir'),
              onPressed: () => context.pop(),
            )

          ),
          
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide(
      {required this.title, required this.caption, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodyLarge;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(imageUrl)),
            const SizedBox(
              height: 20,
            ),
            Text(title, style: titleStyle,),
            const SizedBox(
              height: 10,
            ),
            Text(caption, style: captionStyle)
          ],
        ),
      ),
    );
  }
}
