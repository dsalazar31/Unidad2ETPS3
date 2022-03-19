import 'package:flutter/material.dart';
import 'package:tareaunidad2/constantes.dart';

class Detalle extends StatefulWidget {
  Detalle({Key? key}) : super(key: key);

  @override
  State<Detalle> createState() => _DetalleState();
}

class _DetalleState extends State<Detalle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: ListView(
          children: [appBar(), imagen(), descripcion()],
        ),
      ),
    );
  }

  Widget appBar() {
    return Container(
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 23, 24, 24),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      height: 100,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.backspace,
                  color: Colors.white,
                )),
            const Text(
              "Now Playing",
              style: TextStyle(color: Colors.white),
            ),
            const Icon(
              Icons.heart_broken,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }

  Widget imagen() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(detalleDatos[0].imagen), fit: BoxFit.cover),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
      ),
    );
  }

  Widget descripcion() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
      child: SizedBox(
          child: Text(detalleDatos[0].descripcion,
              style: const TextStyle(color: Colors.white))),
    );
  }
}
