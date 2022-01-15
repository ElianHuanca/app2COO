import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:proyectosig/models/models.dart';
import 'package:http/http.dart' as http;

class AlarmaService extends ChangeNotifier {
  final String _baseUrl = 'sosscz-22cd4-default-rtdb.firebaseio.com';
  final List<AlarmaModel> alarmas = [];
  late AlarmaModel selectedAlarmas;

  bool isLoading = true;
  bool isSavig = false;
  AlarmaService() {
    loadAlarmas();
  }
  Future<List<AlarmaModel>> loadAlarmas() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.https(_baseUrl, 'alarma.json');
    final resp = await http.get(url);
    final Map<String, dynamic> productsMap = json.decode(resp.body);
    productsMap.forEach((key, value) {
      final tempProduct = AlarmaModel.fromMap(value);
      tempProduct.id = key;
      alarmas.add(tempProduct);
    });
    isLoading = false;
    notifyListeners();
    return alarmas;
  }

  Future<String> createAlarma(AlarmaModel product) async {
    final url = Uri.https(_baseUrl, 'alarma.json');
    final resp = await http.post(url, body: product.toJson());
    final decodedData = json.decode(resp.body);
    product.id = decodedData['name'];
    alarmas.add(product);
    return product.id!;
  }
}
