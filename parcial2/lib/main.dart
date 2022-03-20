import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parcial2/datos.dart';
import 'package:parcial2/detalle.dart';
import 'package:parcial2/venta.dart';

void main() {
  runApp(Parcial2());
}

class Parcial2 extends StatelessWidget {
  const Parcial2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Parcial 2, Flutter",
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int tituloSelecionado = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          appBar(),
          mensaje("Comercial SIVAR"),
          buscar(),
          titulos(),
          imagenes(),
          imagenesFooter()
        ],
      ),
    );
  }

  Widget appBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [Icon(Icons.menu), Icon(Icons.shopping_bag_outlined)],
        ),
      ),
    );
  }

  Widget mensaje(String mensaje) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      child: SizedBox(
        child: Text(
          mensaje,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  Widget buscar() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
      ),
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 236, 236, 187),
            borderRadius: BorderRadius.circular(10)),
        child: const TextField(
          decoration: InputDecoration(
              hintText: 'Buscar..',
              prefixIcon: Icon(Icons.search),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 0, color: Color.fromARGB(255, 236, 236, 187)))),
        ),
      ),
    );
  }

  Widget titulos() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SizedBox(
          width: 310,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(datosGenerales.length, (index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    tituloSelecionado = index;
                  });
                },
                child: tituloSelecionado == index
                    ? Container(
                        width: 70,
                        height: 20,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 20, 20, 20),
                            borderRadius: BorderRadius.circular(5)),
                        child: Center(
                          child: Text(
                            datosGenerales[index]["titulo"],
                            style: const TextStyle(color: Colors.white),
                          ),
                        ))
                    : SizedBox(
                        child: Text(datosGenerales[index]["titulo"]),
                      ),
              );
            }),
          ),
        ),
      ),
    );
  }

  Widget imagenes() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(datosGenerales.length, (index) {
          return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    print(datosGenerales[tituloSelecionado]["titulo"]);
                  });
                  detalleDatos = [];
                  detalleDatos.add(DetalleDatos(
                    datosGenerales[tituloSelecionado]["titulo"],
                    datosGenerales[tituloSelecionado]["imagenes"][index]
                        ["imagen"],
                    datosGenerales[tituloSelecionado]["precio"][index]["price"],
                    datosGenerales[tituloSelecionado]["descripcion"][index]
                        ["desc"],
                    datosGenerales[tituloSelecionado]["detalle"][index]["det"],
                  ));

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Detalle(),
                      ));
                },
                child: Container(
                  width: 140,
                  height: 150,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 245, 241, 222),
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: AssetImage(
                              "${datosGenerales[tituloSelecionado]["imagenes"][index]["imagen"]}"))),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10, top: 10),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Icon(
                            Icons.heart_broken,
                            color: Colors.red,
                            size: 20,
                          )),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(datosGenerales[index]["descripcion"][index]["desc"]),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                  width: 100,
                  child: Text(
                    datosGenerales[index]["precio"][index]["price"],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  )),
            )
          ]);
        }),
      ),
    );
  }

  Widget imagenesFooter() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: Row(children: [
        Padding(
          padding: const EdgeInsets.only(left: 25),
          child: Container(
            width: 140,
            height: 150,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 245, 241, 222),
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: AssetImage(
                        "${datosGenerales[1]["imagenes"][2]["imagen"]}"))),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25),
          child: Container(
            width: 140,
            height: 150,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 245, 241, 222),
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: AssetImage(
                        "${datosGenerales[1]["imagenes"][3]["imagen"]}"))),
          ),
        ),
      ]),
    );
  }
}
