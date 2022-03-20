import 'package:flutter/material.dart';
import 'package:parcial2/datos.dart';

class Venta extends StatefulWidget {
  Venta({Key? key}) : super(key: key);

  @override
  State<Venta> createState() => _VentaState();
}

class _VentaState extends State<Venta> {
  int item1 = 0;
  int item2 = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        appBar(),
        item1 == 0 ? items(1) : const SizedBox(),
        item2 == 0 ? items(2) : const SizedBox(),
        footer(),
        buttonVenta()
      ]),
    );
  }

  Widget appBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_outlined),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 100),
              child: Text("Card"),
            )
          ],
        ),
      ),
    );
  }

  Widget buttonVenta() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
      child: SizedBox.fromSize(
        size: const Size(250, 50),
        child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                  const Color.fromARGB(255, 184, 175, 98)),
            ),
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.shopping_bag_outlined),
                Text("Pagar")
              ],
            )),
      ),
    );
  }

  Widget items(int i) {
    return SizedBox(
      child: Row(
        children: [
          imagenItem(),
          Column(
            children: [
              detalle(detalleVenta[0].titulo),
              detalle(detalleVenta[0].precio)
            ],
          ),
          buttonEliminar(i)
        ],
      ),
    );
  }

  Widget imagenItem() {
    return Padding(
      padding: const EdgeInsets.only(left: 25, top: 25),
      child: Container(
        width: 90,
        height: 100,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(detalleVenta[0].imagen), fit: BoxFit.contain),
            color: const Color.fromARGB(255, 240, 238, 225),
            borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  Widget detalle(String mensaje) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Align(
        alignment: Alignment.centerLeft,
        child: SizedBox(width: 100, child: Text(mensaje)),
      ),
    );
  }

  Widget buttonEliminar(int i) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 50,
      ),
      child: SizedBox(
        child: IconButton(
            onPressed: () {
              setState(() {
                if (i == 1) {
                  item1 = 1;
                } else {
                  item2 = 1;
                }
              });
            },
            icon: const Icon(Icons.remove_circle_outline_sharp)),
      ),
    );
  }

  Widget footer() {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 100, bottom: 25),
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [texto("Total"), texto("49.98")],
        ),
      ),
    );
  }

  Widget texto(String mensaje) {
    return SizedBox(
      child: Text(
        mensaje,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
