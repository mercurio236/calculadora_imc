import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Calculadora de IMC',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.green,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.refresh,
                color: Colors.white,
              ),
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment
                  .stretch, //vai ocupar toda a largura vertical da tela
              children: [
                const Icon(
                  Icons.person_outline,
                  size: 100,
                  color: Colors.green,
                ),
                const SizedBox(height: 20),
                const TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: 'Peso em (Kg)',
                      labelStyle: TextStyle(color: Colors.green),
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green)),
                      focusColor: Colors.green,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green))),
                  style: TextStyle(color: Colors.green),
                ),
                const SizedBox(height: 20),
                const TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: 'Altura (cm)',
                      labelStyle: TextStyle(color: Colors.green),
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green)),
                      focusColor: Colors.green,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green))),
                  style: TextStyle(color: Colors.green),
                ),
                const SizedBox(height: 20),
                Container(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Calcular',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                            const MaterialStatePropertyAll<Color>(Colors.green),
                        shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3)))),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Info',
                  style: TextStyle(color: Colors.green, fontSize: 17),
                )
              ]),
        ));
  }
}
