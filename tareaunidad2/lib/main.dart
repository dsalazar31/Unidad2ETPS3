import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tareaunidad2/constantes.dart';
import 'package:tareaunidad2/detalle.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Tarea Unidad 2",
      home: Principal(),
    );
  }
}

class Principal extends StatefulWidget {
  Principal({Key? key}) : super(key: key);

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  int selecionTitulo = 0;
  int imagenSeleccionada = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        body: Container(
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(30)),
          child: ListView(children: [
            appBar(),
            titulo(),
            imagenPrincipal(),
            Container(
              padding: const EdgeInsets.only(top: 25, left: 25),
              child: const Text(
                "Treading this Week",
                style: TextStyle(color: Colors.white),
              ),
            ),
            bloque2(),
            Container(
              padding: const EdgeInsets.only(top: 25, left: 25),
              child: const Text(
                "New Album",
                style: TextStyle(color: Colors.white),
              ),
            ),
            bloque3(),
          ]),
        ));
  }

  Widget appBar() {
    return Padding(
      padding: const EdgeInsets.only(left: 35, right: 25, top: 35),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Text(
              "Music",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  image: const DecorationImage(
                      image: AssetImage("assets/imagen3.jpg"),
                      fit: BoxFit.cover)),
            )
          ],
        ),
      ),
    );
  }

  Widget titulo() {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 25, right: 25),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(opciones.length, (index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selecionTitulo = index;
                });
              },
              child: Container(
                width: 70,
                height: 20,
                decoration: BoxDecoration(
                    color: selecionTitulo == index
                        ? Colors.lightBlue
                        : Colors.black,
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                  child: Text(
                    opciones[index],
                    style: TextStyle(
                        color: selecionTitulo == index
                            ? Colors.black
                            : Colors.white),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget imagenPrincipal() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        children: [
          Row(
            children: List.generate(imagenes.length, (index) {
              return Column(children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25, top: 25, right: 25),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        imagenSeleccionada = index;
                      });
                      detalleDatos = [];
                      detalleDatos.add(DetalleDatos(
                          imagenes[selecionTitulo]['descripcion'][index],
                          imagenes[selecionTitulo]["imagen"][index]["imagen"]));
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Detalle()));
                    },
                    child: Container(
                      height: 200,
                      width: 300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: AssetImage(imagenes[selecionTitulo]
                                  ["imagen"][index]["imagen"]),
                              fit: BoxFit.cover)),
                    ),
                  ),
                ),
                //imagenSeleccionada == index ? descripcion(index) : Container()
              ]);
            }),
          ),
        ],
      ),
    );
  }

  Widget bloque2() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(bloquedo2.length, (index) {
            return Column(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(bloquedo2[index]["imagen"]),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(10)),
                ),
                Text(
                  bloquedo2[index]["titulo"],
                  style: const TextStyle(color: Colors.white),
                ),
                Text(
                  bloquedo2[index]["descripcion"],
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }

  Widget bloque3() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: List.generate(bloquedo3.length, (index) {
            return Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Container(
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(bloquedo3[index]), fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(10)),
              ),
            );
          }),
        ),
      ),
    );
  }
}
