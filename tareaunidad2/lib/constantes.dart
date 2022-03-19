import 'package:flutter/cupertino.dart';

const List opciones = ["Overview", "Tack", "Album", "Follow"];

const List imagenes = [
  {
    "tipos": "OverView",
    "imagen": [
      {"imagen": "assets/imagen7.webp"},
      {"imagen": "assets/imagen8.jpg"},
      {"imagen": "assets/imagen6.jpg"},
      {"imagen": "assets/imagen1.jpeg"}
    ],
    "descripcion": [
      "El gato es un animal de hogar",
      "El tigre es un felino salvaje",
      "Los gatos son animales tiernos",
      "Unas vista hermosa de un atardecer, acompañado de hermosos animales"
    ]
  },
  {
    "tipos": "Tack",
    "imagen": [
      {"imagen": "assets/imagen4.jpg"},
      {"imagen": "assets/imagen3.jpg"},
      {"imagen": "assets/imagen10.jpg"},
      {"imagen": "assets/imagen11.jpg"},
    ],
    "descripcion": [
      "El tigre vengala, uno de los mas rapidos",
      "Hermosa vista de la playa",
      "El perro, considerado el mejor amigo del hombre",
      "Un hermoso gatito"
    ]
  },
  {
    "tipos": "Album",
    "imagen": [
      {"imagen": "assets/imagen9.webp"},
      {"imagen": "assets/imagen10.jpg"},
      {"imagen": "assets/imagen11.jpg"},
      {"imagen": "assets/imagen3.jpg"}
    ],
    "descripcion": [
      "Hermosos gatitos",
      "El perro, considerado el mejor amigo del hombre",
      "Un hermoso gatito",
      "Hermosa vista de la playa",
    ]
  },
  {
    "tipos": "Follow",
    "imagen": [
      {"imagen": "assets/imagen9.webp"},
      {"imagen": "assets/imagen3.jpg"},
      {"imagen": "assets/imagen6.jpg"},
      {"imagen": "assets/imagen11.jpg"}
    ],
    "descripcion": [
      "Hermosos gatitos",
      "El perro, considerado el mejor amigo del hombre",
      "Un hermoso gatito",
      "Hermosa vista de la playa",
    ]
  },
];

const List bloquedo2 = [
  {
    "titulo": "Photogroph",
    "descripcion": "León",
    "imagen": "assets/imagen8.jpg"
  },
  {
    "titulo": "Atardecer",
    "descripcion": "Alces",
    "imagen": "assets/imagen2.jpg"
  },
  {
    "titulo": "Atardecer",
    "descripcion": "Jirafas",
    "imagen": "assets/imagen1.jpeg"
  }
];

const List bloquedo3 = ["assets/imagen11.jpg", "assets/imagen9.webp"];

class DetalleDatos {
  final String descripcion;
  final String imagen;

  DetalleDatos(this.descripcion, this.imagen);
}

List<DetalleDatos> detalleDatos = [];
