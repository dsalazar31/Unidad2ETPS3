import 'package:flutter/material.dart';
import 'package:parcial2/datos.dart';
import 'package:parcial2/venta.dart';

class Detalle extends StatefulWidget {
  Detalle({Key? key}) : super(key: key);

  @override
  State<Detalle> createState() => _DetalleState();
}

class _DetalleState extends State<Detalle> {
  int color = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 231, 230, 218),
      body: ListView(children: [appBar(), imagen(), descripcion()]),
    );
  }

  Widget appBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_outlined),
            ),
            const Icon(Icons.shopping_bag_outlined)
          ],
        ),
      ),
    );
  }

  Widget imagen() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: detalleDatos[0].categoria != "Sillas"
                    ? AssetImage(detalleDatos[0].imagen)
                    : color == -1
                        ? AssetImage(detalleDatos[0].imagen)
                        : color == 1
                            ? const AssetImage("assets/sillas/Grupo 1.png")
                            : color == 2
                                ? const AssetImage("assets/sillas/Grupo 2.png")
                                : const AssetImage("assets/sillas/Grupo 3.png"),
                fit: BoxFit.contain)),
        child: Padding(
          padding: const EdgeInsets.only(right: 30),
          child: Align(
            alignment: Alignment.bottomRight,
            child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 20,
                )),
          ),
        ),
      ),
    );
  }

  Widget descripcion() {
    return Container(
      height: 400,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25))),
      child: Padding(
        padding: const EdgeInsets.only(top: 20, left: 25, right: 25),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(detalleDatos[0].titulo),
                Text(detalleDatos[0].precio)
              ],
            ),
            Row(
              children: [
                icono(),
                icono(),
                icono(),
                icono(),
                icono(),
                const Padding(
                  padding: EdgeInsets.only(top: 10, left: 10),
                  child: Text("200 Reviews"),
                )
              ],
            ),
            detalle(),
            Row(
              children: [
                colores(Colors.green, 1),
                colores(Colors.yellow, 2),
                colores(Colors.red, 3)
              ],
            ),
            const SizedBox(
              height: 75,
            ),
            buttonComprar()
          ],
        ),
      ),
    );
  }

  Widget icono() {
    return const Padding(
      padding: EdgeInsets.only(top: 10),
      child:
          Icon(Icons.star, color: Color.fromARGB(255, 224, 205, 26), size: 20),
    );
  }

  Widget detalle() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Container(
        child: Text(detalleDatos[0].descripcion),
      ),
    );
  }

  Widget colores(Color colores, int i) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
      ),
      child: GestureDetector(
        onTap: () {
          setState(() {
            color = i;
          });
        },
        child: Container(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
                color: colores, borderRadius: BorderRadius.circular(15))),
      ),
    );
  }

  Widget buttonComprar() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: SizedBox.fromSize(
        size: const Size(250, 50),
        child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                  const Color.fromARGB(255, 184, 175, 98)),
            ),
            onPressed: () {
              detalleVenta = [];
              detalleVenta.add(DetalleVenta(
                  detalleDatos[0].categoria != "Sillas"
                      ? detalleDatos[0].imagen
                      : color == -1
                          ? detalleDatos[0].imagen
                          : color == 1
                              ? "assets/sillas/Grupo 1.png"
                              : color == 2
                                  ? "assets/sillas/Grupo 2.png"
                                  : "assets/sillas/Grupo 3.png",
                  detalleDatos[0].precio,
                  detalleDatos[0].titulo));
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Venta()));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.shopping_bag_outlined),
                Text("Comprar")
              ],
            )),
      ),
    );
  }
}
