import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../screens/denuncia_screen.dart';

void main() {
  runApp(const InformacionDengue());
}

class InformacionDengue extends StatelessWidget {
  static const name = 'informacion_dengue';
  const InformacionDengue({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
    'assets/dengue/dengue_info_1.jpg',
    'assets/dengue/dengue_info_2.jpg',
    'assets/dengue/dengue_info_3.jpg',
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
                    child: VideoWidget(), 
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DenunciaScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      textStyle: const TextStyle(fontSize: 12),
                    ),
                    child: const Text('REALIZAR DENUNCIA', style: TextStyle(color: Colors.white)),
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
