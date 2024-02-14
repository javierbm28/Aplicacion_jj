import 'package:flutter/material.dart';
import 'package:aplicacion_jj/pagina1.dart';
import 'package:aplicacion_jj/comida.dart';
import 'package:aplicacion_jj/revision.dart';
import 'package:aplicacion_jj/tickets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CineMax',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        comidaList: comidaList,
        bebidasList: bebidasList,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final List<Comida> comidaList;
  final List<Comida> bebidasList;

  MyHomePage({
    required this.comidaList,
    required this.bebidasList,
  });

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    ScreenHome(),
    ScreenTicket(),
    ScreenComida(),
    ScreenRevision(selectedMovie: null, selectedFoodList: [], selectedDrinkList: []),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.red.shade900,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.confirmation_number_sharp),
            label: 'Tickets',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood),
            label: 'Comida',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check),
            label: 'Revision',
          ),
        ],
      ),
    );
  }
}

