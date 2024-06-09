import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp2());
}

class MyApp2 extends StatelessWidget {
  const MyApp2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portafolio Educativo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<String> imageList = [
    'assets/dengue_info_1.png',
    'assets/dengue_info_2.png',
    'assets/dengue_info_3.png',
  ];

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Portafolio educativo'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 200.0,
                autoPlay: true,
                enlargeCenterPage: true,
              ),
              items: imageList.map((item) => Image.asset(item)).toList(),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Text(
                    'Conoce la sintomatología y signos de alarma',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const AspectRatio(
                    aspectRatio: 16 / 9,
                    child:
                        VideoWidget(), // Implementa tu propio widget de video aquí
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      // Lógica de denuncia aquí
                    },
                    child: const Text('DENUNCIA'),
                  ),
                  const SizedBox(height: 16),
                  Card(
                    color: Colors.lightGreen[100],
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        '¿Sabías que...?\n\n'
                        '1. Un criadero puede albergar miles de mosquitos.\n'
                        '2. El mosquito Aedes aegypti, transmisor del dengue, se reproduce en agua estancada.\n'
                        '3. La eliminación oportuna de criaderos ayuda a las autoridades a tomar medidas de control y prevenir la propagación de la enfermedad.\n\n'
                        'Tu colaboración es importante!\n'
                        'Denuncia hoy mismo y protege a tu comunidad.',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VideoWidget extends StatelessWidget {
  const VideoWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: const Center(
        child: Icon(
          Icons.play_arrow,
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }
}
