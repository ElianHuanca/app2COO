// To parse this JSON data, do
//
//     final alarmaModel = alarmaModelFromMap(jsonString);

import 'dart:convert';

class AlarmaModel {
  AlarmaModel({
    required this.estado,
    required this.fecha,
    required this.hora,
    required this.latitud,
    required this.longitud,
    required this.tipo,
  });

  String estado;
  String hora;
  String fecha;
  double latitud;
  double longitud;
  String tipo;
  String? id;

  factory AlarmaModel.fromJson(String str) =>
      AlarmaModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AlarmaModel.fromMap(Map<String, dynamic> json) => AlarmaModel(
        estado: json["estado"],
        fecha: json["fecha"],
        hora: json["hora"],
        latitud: json["latitud"].toDouble(),
        longitud: json["longitud"].toDouble(),
        tipo: json["tipo"],
      );

  Map<String, dynamic> toMap() => {
        "estado": estado,
        "fecha": fecha,
        "hora": hora,
        "latitud": latitud,
        "longitud": longitud,
        "tipo": tipo,
      };
  AlarmaModel copy() => AlarmaModel(
      estado: estado,
      fecha: fecha,
      hora: hora,
      latitud: latitud,
      longitud: longitud,
      tipo: tipo);
}
