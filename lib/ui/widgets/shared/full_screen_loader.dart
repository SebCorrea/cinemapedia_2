import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  Stream<String> getLoadingMessages() {
    final List<String> loadingMessages = [
      'Cargando películas',
      'Comprando palomitas de maíz',
      'Cargando tus películas favoritas',
      'Encendiendo aire acondicionado',
      'Pensando cuál película ver',
      'Ahorrando para la siguiente suscripción',
      'Ya me cansé de mandarte mensajes de carga',
      'Mejora tu internet',
      'De verdad mejora tu internet',
      'No puedo con esto...',
    ];
    return Stream.periodic(const Duration(seconds: 4), (step) {
      return loadingMessages[step];
    }).take(loadingMessages.length);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Espere por favor'),
          const SizedBox(height: 10),
          const CircularProgressIndicator(strokeWidth: 2),
          const SizedBox(height: 10),
          StreamBuilder(
            stream: getLoadingMessages(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return const Text('Cargando...');
              return Text(snapshot.data!);
            },
          )
        ],
      ),
    );
  }
}
