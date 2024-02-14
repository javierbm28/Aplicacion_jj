import 'package:flutter/material.dart';

class ScreenComida extends StatefulWidget {
  @override
  _ScreenComidaState createState() => _ScreenComidaState();
}

class _ScreenComidaState extends State<ScreenComida> {
  final List<Comida> comidaList = [
    Comida(nombre: 'Pizzas', precio: 10),
    Comida(nombre: 'Hamburguesas', precio: 8),
    Comida(nombre: 'Palomitas', precio: 5),
    Comida(nombre: 'Hotdogs', precio: 6),
  ];

  final List<Comida> bebidasList = [
    Comida(nombre: 'Agua', precio: 1),
    Comida(nombre: 'Coca-Cola', precio: 2),
    Comida(nombre: 'Fanta', precio: 2),
    Comida(nombre: 'Cerveza', precio: 2),
  ];

  Map<String, int> comidaQuantities = {};
  Map<String, int> bebidasQuantities = {};

  double calcularPrecioTotal() {
    double total = 0;

    comidaQuantities.forEach((key, value) {
      final comida = comidaList.firstWhere((element) => element.nombre == key, orElse: () => Comida(nombre: '', precio: 0));
      total += comida.precio * value;
    });

    bebidasQuantities.forEach((key, value) {
      final bebida = bebidasList.firstWhere((element) => element.nombre == key, orElse: () => Comida(nombre: '', precio: 0));
      total += bebida.precio * value;
    });

    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Comida')),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(16.0),
              itemCount: comidaList.length + bebidasList.length + 2,
              itemBuilder: (BuildContext context, int index) {
                if (index == 0) {
                  return const Padding(
                    padding: EdgeInsets.only(top: 8.0, bottom: 4.0),
                    child: Text(
                      'Comida',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  );
                } else if (index == comidaList.length + 1) {
                  return const Padding(
                    padding: EdgeInsets.only(top: 8.0, bottom: 4.0),
                    child: Text(
                      'Bebidas',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  );
                } else if (index <= comidaList.length) {
                  final comidaIndex = index - 1;
                  final comida = comidaList[comidaIndex];
                  return ListTile(
                    title: Text('${comida.nombre} - \$${comida.precio}'),
                    trailing: SizedBox(
                      width: 100,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(labelText: 'Cantidad'),
                        onChanged: (value) {
                          final quantity = int.tryParse(value) ?? 0;
                          setState(() {
                            comidaQuantities[comida.nombre] = quantity;
                          });
                        },
                      ),
                    ),
                  );
                } else {
                  final bebidaIndex = index - comidaList.length - 2;
                  final bebida = bebidasList[bebidaIndex];
                  return ListTile(
                    title: Text('${bebida.nombre} - \$${bebida.precio}'),
                    trailing: SizedBox(
                      width: 100,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(labelText: 'Cantidad'),
                        onChanged: (value) {
                          final quantity = int.tryParse(value) ?? 0;
                          setState(() {
                            bebidasQuantities[bebida.nombre] = quantity;
                          });
                        },
                      ),
                    ),
                  );
                }
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(
                  color: Colors.grey,
                  height: 1,
                  thickness: 1,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              'Total a pagar: \$${calcularPrecioTotal().toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class Comida {
  final String nombre;
  final double precio;
  int quantity; 

  Comida({required this.nombre, required this.precio, this.quantity = 0});
}





