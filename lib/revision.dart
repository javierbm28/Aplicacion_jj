import 'package:aplicacion_jj/comida.dart';
import 'package:aplicacion_jj/tickets.dart';
import 'package:flutter/material.dart';

class ScreenRevision extends StatelessWidget {
  final Movie? selectedMovie;
  final List<Comida> selectedFoodList;
  final List<Comida> selectedDrinkList;

  const ScreenRevision({
    required this.selectedMovie,
    required this.selectedFoodList,
    required this.selectedDrinkList,
  });

  @override
  Widget build(BuildContext context) {
    double totalFoodPrice = 0;
    selectedFoodList.forEach((food) {
      totalFoodPrice += food.precio * food.quantity;
    });

    double totalDrinkPrice = 0;
    selectedDrinkList.forEach((drink) {
      totalDrinkPrice += drink.precio * drink.quantity;
    });

    final totalPrice = (selectedMovie?.price ?? 0) + totalFoodPrice + totalDrinkPrice;

    return Scaffold(
      appBar: AppBar(title: const Text('Revision')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (selectedMovie != null) Text('Pelicula seleccionada: ${selectedMovie!.title}'),
            Text('Comida seleccionada:'),
            for (final food in selectedFoodList)
              Text('${food.nombre}: ${food.quantity}'),
            Text('Bebida seleccionada:'),
            for (final drink in selectedDrinkList)
              Text('${drink.nombre}: ${drink.quantity}'),
            Text('Total a pagar: \$${totalPrice.toStringAsFixed(2)}'),
          ],
        ),
      ),
    );
  }
}

