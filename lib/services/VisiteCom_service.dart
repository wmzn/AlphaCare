import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:argon_flutter/models/VisiteCom.dart';
import 'package:argon_flutter/screens/LogingScreen.dart';
import 'package:http/http.dart';

class ApiVisiteComService {
  final apiUrl = "https://1.1.1.1/";
  Map data = {
    "id": Loginscreenn.id,
  };
  Future<List<VisiteCom>> getVisitesCom() async {
    Response res = await post(Uri.parse(apiUrl + "getVisiteCom/id"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<VisiteCom> VisitesCom =
      body.map((dynamic item) => VisiteCom.fromJson(item)).toList();
      return VisitesCom.reversed.toList();
    } else {
      throw "Failed to load cases list";
    }
  }

  Future<VisiteCom> getCaseById(String id) async {
    final response = await get(Uri.parse('$apiUrl/$id'));

    if (response.statusCode == 200) {
      return VisiteCom.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load a case');
    }
  }

  Future<VisiteCom> createVisiteCom(VisiteCom VisitesCom) async {
    Map data = {
      "NomPharmacie": VisitesCom.NomPharmacie,
      "NomPharmacieid": VisitesCom.NomPharmacieid,
      "V1": VisitesCom.V1,
      "V2": VisitesCom.V2,
      "V3": VisitesCom.V3,
      "V4": VisitesCom.V4,
      "id": Loginscreenn.id,
      "V5": VisitesCom.V5,
      "V6": VisitesCom.V6,
      "V7": VisitesCom.V7,
      "V8": VisitesCom.V8,
      "V9": VisitesCom.V9,
      "Rapport": VisitesCom.Rapport,
      "Lat": VisitesCom.Lat,
      "Lng": VisitesCom.Lng,
      "Medicament1": VisitesCom.Medicament1,
      "Medicament2": VisitesCom.Medicament2,
      "Medicament3": VisitesCom.Medicament3,
      "Medicament4": VisitesCom.Medicament4,
      "Medicament5": VisitesCom.Medicament5,
      "Medicament6": VisitesCom.Medicament6,
      "Medicament7": VisitesCom.Medicament7,
      "Medicament8": VisitesCom.Medicament8,
      "Medicament9": VisitesCom.Medicament9,
      "Medicament10": VisitesCom.Medicament10,
      "Medicament11": VisitesCom.Medicament11,
      "Medicament12": VisitesCom.Medicament12,
      "Dispo1": VisitesCom.Dispo1,
      "Dispo2": VisitesCom.Dispo2,
      "Dispo3": VisitesCom.Dispo3,
      "Dispo4": VisitesCom.Dispo4,
      "Dispo5": VisitesCom.Dispo5,
      "Dispo6": VisitesCom.Dispo6,
      "Dispo7": VisitesCom.Dispo7,
      "Dispo8": VisitesCom.Dispo8,
      "Dispo9": VisitesCom.Dispo9,
      "Dispo10": VisitesCom.Dispo10,
      "Dispo11": VisitesCom.Dispo11,
      "Dispo12": VisitesCom.Dispo12,
      "Rotation1": VisitesCom.Rotation1,
      "Rotation2": VisitesCom.Rotation2,
      "Rotation3": VisitesCom.Rotation3,
      "Rotation4": VisitesCom.Rotation4,
      "Rotation5": VisitesCom.Rotation5,
      "Rotation6": VisitesCom.Rotation6,
      "Rotation7": VisitesCom.Rotation7,
      "Rotation8": VisitesCom.Rotation8,
      "Rotation9": VisitesCom.Rotation9,
      "Rotation10": VisitesCom.Rotation10,
      "Rotation11": VisitesCom.Rotation11,
      "Rotation12": VisitesCom.Rotation12,
      "Commande1": VisitesCom.Commande1,
      "Commande2": VisitesCom.Commande2,
      "Commande3": VisitesCom.Commande3,
      "Commande4": VisitesCom.Commande4,
      "Commande5": VisitesCom.Commande5,
      "Commande6": VisitesCom.Commande6,
      "Commande7": VisitesCom.Commande7,
      "Commande8": VisitesCom.Commande8,
      "Commande9": VisitesCom.Commande9,
      "Commande10": VisitesCom.Commande10,
      "Commande11": VisitesCom.Commande11,
      "Commande12": VisitesCom.Commande12
    };
    print('\x1B[33m $data\x1B[0m');
    final Response response = await post(
      Uri.parse(apiUrl + "AjouterVisiteCom"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      print("ok");
      return VisiteCom.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to post cases');
    }
  }

  Future<VisiteCom> updateVisiteCom(VisiteCom VisitesCom) async {
    Map data = {
      'id': VisitesCom.id,
      "NomPharmacie": VisitesCom.NomPharmacie,
      "NomPharmacieid": VisitesCom.NomPharmacieid,
      "V1": VisitesCom.V1,
      "V2": VisitesCom.V2,
      "V3": VisitesCom.V3,
      "V4": VisitesCom.V4,
      "V5": VisitesCom.V5,
      "V6": VisitesCom.V6,
      "V7": VisitesCom.V7,
      "V8": VisitesCom.V8,
      "V9": VisitesCom.V9,
      "NomContact": Loginscreenn.id,
      "Rapport": VisitesCom.Rapport,
      //"Lat": VisitesCom.Lat,
      //"Lng": VisitesCom.Lng,
      "Medicament1": VisitesCom.Medicament1,
      "Medicament2": VisitesCom.Medicament2,
      "Medicament3": VisitesCom.Medicament3,
      "Medicament4": VisitesCom.Medicament4,
      "Medicament5": VisitesCom.Medicament5,
      "Medicament6": VisitesCom.Medicament6,
      "Medicament7": VisitesCom.Medicament7,
      "Medicament8": VisitesCom.Medicament8,
      "Medicament9": VisitesCom.Medicament9,
      "Medicament10": VisitesCom.Medicament10,
      "Medicament11": VisitesCom.Medicament11,
      "Medicament12": VisitesCom.Medicament12,
      "Dispo1": VisitesCom.Dispo1,
      "Dispo2": VisitesCom.Dispo2,
      "Dispo3": VisitesCom.Dispo3,
      "Dispo4": VisitesCom.Dispo4,
      "Dispo5": VisitesCom.Dispo5,
      "Dispo6": VisitesCom.Dispo6,
      "Dispo7": VisitesCom.Dispo7,
      "Dispo8": VisitesCom.Dispo8,
      "Dispo9": VisitesCom.Dispo9,
      "Dispo10": VisitesCom.Dispo10,
      "Dispo11": VisitesCom.Dispo11,
      "Dispo12": VisitesCom.Dispo12,
      "Rotation1": VisitesCom.Rotation1,
      "Rotation2": VisitesCom.Rotation2,
      "Rotation3": VisitesCom.Rotation3,
      "Rotation4": VisitesCom.Rotation4,
      "Rotation5": VisitesCom.Rotation5,
      "Rotation6": VisitesCom.Rotation6,
      "Rotation7": VisitesCom.Rotation7,
      "Rotation8": VisitesCom.Rotation8,
      "Rotation9": VisitesCom.Rotation9,
      "Rotation10": VisitesCom.Rotation10,
      "Rotation11": VisitesCom.Rotation11,
      "Rotation12": VisitesCom.Rotation12,
      "Commande1": VisitesCom.Commande1,
      "Commande2": VisitesCom.Commande2,
      "Commande3": VisitesCom.Commande3,
      "Commande4": VisitesCom.Commande4,
      "Commande5": VisitesCom.Commande5,
      "Commande6": VisitesCom.Commande6,
      "Commande7": VisitesCom.Commande7,
      "Commande8": VisitesCom.Commande8,
      "Commande9": VisitesCom.Commande9,
      "Commande10": VisitesCom.Commande10,
      "Commande11": VisitesCom.Commande11,
      "Commande12": VisitesCom.Commande12
    };
    print('\x1B[33m okokokok\x1B[0m');
    print(data);
    final Response response = await post(
      Uri.parse('$apiUrl' + "modificationVisiteCom"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    print("update3");
    if (response.statusCode == 200) {
      print(response.body);

      print("update4");

      return VisiteCom.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update a case');
    }
  }

  Future<void> deleteVisiteCom(String id) async {
    Map data = {
      'id': id,
    };
    Response res = await post(
      Uri.parse('$apiUrl' + "deleteVisiteCom"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );

    if (res.statusCode == 200) {
      print("Case deleted");
    } else {
      throw "Failed to delete a case.";
    }
  }
}
