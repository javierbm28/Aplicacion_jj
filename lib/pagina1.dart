import 'package:flutter/material.dart';

class ScreenHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          'https://www.shutterstock.com/image-photo/cinema-blank-wide-screen-people-600nw-2314929885.jpg',
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        ),
        Positioned.fill(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start, // Alineación en la parte superior
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.20), // Espacio para mover el título hacia arriba
              const Text(
                '¡Bienvenido al CineMax!',
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Color de la letra negro
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }
}









