import 'dart:convert';
import 'dart:io';
import 'dart:async';

import 'package:argon_flutter/models/pharmacie.dart';
import 'package:argon_flutter/screens/LogingScreen.dart';
import 'package:http/http.dart';

class PharmacieService {
  final apiUrl = "https://1.1.1.1/";
  Future<List<Pharmacies>> getPharmacie2() async {
    Response res = await get(Uri.parse(apiUrl + "getPharmacie"));
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Pharmacies> pharmacie =
      body.map((dynamic item) => Pharmacies.fromJson(item)).toList();

      return pharmacie.reversed.toList();
    } else {
      throw "Failed to load cases list";
    }
  }

  Future<List<Pharmacies>> getPharmacies() async {
    Map data = {
      "id": Loginscreenn.id,
    };
    Response res = await post(Uri.parse(apiUrl + "getPharmacie/id"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Pharmacies> pharmacies =
      body.map((dynamic item) => Pharmacies.fromJson(item)).toList();
      return pharmacies;
    } else {
      throw "Failed to load cases list";
    }
  }

  Future<Pharmacies> getPharmacieById(String id) async {
    final response = await get(Uri.parse('$apiUrl/$id'));
    Map data = {
      "NomContact": Loginscreenn.id,
    };
    if (response.statusCode == 200) {
      return Pharmacies.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load a case');
    }
  }

  Future<Pharmacies> createPharmacie(Pharmacies pharmacies) async {
    Map data = {
      'NomPharmacie': pharmacies.NomPharmacie,
      'Type': pharmacies.Type,
      'NomVcom': pharmacies.NomVcom,
      'gender': pharmacies.gender,
      'name': pharmacies.name,
      'age': pharmacies.age,
      'address': pharmacies.address,
      'city': pharmacies.city,
      'country': pharmacies.country,
      'status': pharmacies.status,
      "Lng": pharmacies.Lng,
      "Lat": pharmacies.Lat,
      "NomContact": Loginscreenn.id,
      "Phone": pharmacies.Phone,
      "Wilaya": pharmacies.Wilaya,
      "Commun": pharmacies.Commun,
      "Daira": pharmacies.Daira,
      "CodeP": pharmacies.CodeP,
      "Route": pharmacies.Route,
      "email": pharmacies.email,
      "potentielProduit":pharmacies.potentielProduit,
    };

    final Response response = await post(
      Uri.parse(apiUrl + "AjouterPharmacie"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    print("ok2");

    if (response.statusCode == 200) {
      print("ok");
      return Pharmacies.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to post cases');
    }
  }

  Future<Pharmacies> updatePharmacie(Pharmacies pharmacies) async {
    Map data = {
      'id': pharmacies.id,
      'name': pharmacies.name,
      'NomPharmacie': pharmacies.NomPharmacie,
      'Type': pharmacies.Type,
      'NomVcom': pharmacies.NomVcom,
      'gender': pharmacies.gender,
      'age': pharmacies.age,
      'address': pharmacies.address,
      'city': pharmacies.city,
      'country': pharmacies.country,
      'status': pharmacies.status,
      "Lng": pharmacies.Lng,
      "Lat": pharmacies.Lat,
      "NomContact": Loginscreenn.id,
      "Phone": pharmacies.Phone,
      "Wilaya": pharmacies.Wilaya,
      "Commun": pharmacies.Commun,
      "Daira": pharmacies.Daira,
      "CodeP": pharmacies.CodeP,
      "Route": pharmacies.Route,
      "email": pharmacies.email,
      "potentielProduit":pharmacies.potentielProduit,
    };
    print('\x1B[33m okokokok\x1B[0m');
    print(data);
    final Response response = await post(
      Uri.parse('$apiUrl' + "modificationPharmacie"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    print("update3");
    if (response.statusCode == 200) {
      print(response.body);

      print("update4");

      return Pharmacies.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update a case');
    }
  }

  Future<void> deletePharmacie(String id) async {
    Map data = {
      'id': id,
    };
    Response res = await post(
      Uri.parse('$apiUrl' + "deletePharmacie"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );

    if (res.statusCode == 200) {
      print("Pharma deleted");
    } else {
      throw "Failed to delete a pharma.";
    }
  }
}
