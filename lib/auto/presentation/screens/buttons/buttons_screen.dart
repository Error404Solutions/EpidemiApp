import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreens extends StatelessWidget {
  static const String name = 'buttons_screen';

  const ButtonsScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons screens'),
      ),
      body: const _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back_ios_rounded),
        onPressed: () {
          context.pop();
        },
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Wrap(
          spacing: 10,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(onPressed: () {}, child: const Text('data')),
            const ElevatedButton(onPressed: null , child: Text('disabled')),
      
            ElevatedButton.icon(
              onPressed: () { }, 
              icon: const Icon(Icons.access_alarm_rounded), 
              label: const Text('Icon')
            ),

            FilledButton( onPressed: () {},child: const Text('text')),
            FilledButton.icon( 
              onPressed: () {},
              icon: const Icon( Icons.accessibility_new ),
              label: const Text ('Filled')
            ),


            OutlinedButton(onPressed: () { }, child: const Text ('outline')),
            OutlinedButton.icon(
              onPressed: () { }, 
              label: const Text('Outline boton'),
              icon: const Icon (Icons.terminal)
            ),

            TextButton(onPressed: () { } , child: const Text('Text')),
            TextButton.icon(
              onPressed: () { } ,
              icon: const Icon(Icons.account_box_outlined),
              label: const Text('Text Icon'), 
            ),

            //TODO  custom button

            IconButton(onPressed: () { }, icon: const Icon(Icons.app_registration_rounded)),
            IconButton(
              onPressed: () { }, 
              icon: const Icon(Icons.app_registration_rounded),
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(colors.primary),
                iconColor: const MaterialStatePropertyAll(Colors.white),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
