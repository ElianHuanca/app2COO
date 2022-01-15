// To parse this JSON data, do
//
//     final ciudadanoModel = ciudadanoModelFromMap(jsonString);

import 'dart:convert';

class CiudadanoModel {
    CiudadanoModel({
        required this.celular,
        required this.correo,
        required this.nombre,
    });

    int celular;
    String correo;
    String nombre;

    factory CiudadanoModel.fromJson(String str) => CiudadanoModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory CiudadanoModel.fromMap(Map<String, dynamic> json) => CiudadanoModel(
        celular: json["celular"],
        correo: json["correo"],
        nombre: json["nombre"],
    );

    Map<String, dynamic> toMap() => {
        "celular": celular,
        "correo": correo,
        "nombre": nombre,
    };
}
