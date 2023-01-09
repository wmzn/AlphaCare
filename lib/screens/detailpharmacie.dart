import 'package:argon_flutter/widgets/card-horizontal.dart';
import 'package:argon_flutter/widgets/navbar.dart';
import 'package:flutter/material.dart';
import 'package:argon_flutter/services/Pharmacie_service.dart';
import 'package:argon_flutter/screens/editdatapharmacie.dart';
import 'package:argon_flutter/models/pharmacie.dart';
import 'package:argon_flutter/constants/Theme.dart';
import 'package:getwidget/components/toast/gf_toast.dart';
import 'package:location/location.dart';

class DetailPharmacie extends StatefulWidget {
  DetailPharmacie(this.pharmacies);

  final Pharmacies pharmacies;

  @override
  _DetailPharmacieState createState() => _DetailPharmacieState();
}

class _DetailPharmacieState extends State<DetailPharmacie> {
  _DetailPharmacieState();
  Location _location = Location();
  void activateLocation() async {
    await _location.requestPermission();
    if (await _location.hasPermission() == PermissionStatus.granted) {
      _navigateToEditScreen(context, widget.pharmacies);
    } else {
      GFToast.showToast(
        'Il est nécessaire d\'activer la permission',
        context,
      );
    }
  }

  final PharmacieService api = PharmacieService();
  String pPation = "";
  String pProduit = "";
  String Secteur = "";

  final elements1 = [
    'Pharmacie',
    'Parapharmacie',
    'Grossiste',
    'Super-grossiste',
  ];

  @override
  Widget build(BuildContext context) {
    if (widget.pharmacies.potentielProduit == "1") {
      pProduit = "A";
    } else if (widget.pharmacies.potentielProduit == "2") {
      pProduit = "B";
    } else if (widget.pharmacies.potentielProduit == "3") {
      pProduit = "C";
    }
    return Scaffold(
      appBar: Navbar(
          title: "Detaille Point de Vente",
          rightOptions: false,
          backButton: true,
          bgColor: ArgonColors.success),
      backgroundColor: ArgonColors.bgColorScreen,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(1.0),
          child: Card(
              child: Container(
                  padding: EdgeInsets.all(25.0),
                  width: 440,
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: [
                                Icon(Icons.account_circle,
                                    color: ArgonColors.success),
                                Padding(
                                  padding: const EdgeInsets.only(top: 0.0),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      " Nom PV  :" + widget.pharmacies.NomPharmacie,
                                      style: TextStyle(
                                          fontSize: 19,
                                          color: ArgonColors.text),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: [
                                Icon(Icons.call_outlined,
                                    color: ArgonColors.success),
                                Padding(
                                  padding: const EdgeInsets.only(top: 0.0),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      " Téléphone :" + widget.pharmacies.Phone,
                                      style: TextStyle(
                                          fontSize: 19,
                                          color: ArgonColors.text),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: [
                                Icon(Icons.domain_outlined,
                                    color: ArgonColors.success),
                                Padding(
                                  padding: const EdgeInsets.only(top: 0.0),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      " E-mail :" + widget.pharmacies.email,
                                      style: TextStyle(
                                          fontSize: 19,
                                          color: ArgonColors.text),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: [
                                Icon(Icons.domain_outlined,
                                    color: ArgonColors.success),
                                Padding(
                                  padding: const EdgeInsets.only(top: 0.0),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      " Type PV :" +elements1[int.parse(widget.pharmacies.Type)],
                                      style: TextStyle(
                                          fontSize: 19,
                                          color: ArgonColors.text),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: [
                                Icon(Icons.domain_outlined,
                                    color: ArgonColors.success),
                                Padding(
                                  padding: const EdgeInsets.only(top: 0.0),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      " Potentiel Produit :" + pProduit,
                                      style: TextStyle(
                                          fontSize: 19,
                                          color: ArgonColors.text),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Icon(Icons.location_on_outlined,
                                    color: ArgonColors.success),
                                Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 0.0),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          " Adresse :" +
                                              widget.pharmacies.Wilaya +
                                              " " +
                                              widget.pharmacies.Commun +
                                              " " +
                                              widget.pharmacies.Daira +
                                              " " +
                                              widget.pharmacies.Route,
                                          maxLines: 3,
                                          softWrap: true,
                                          style: TextStyle(
                                              fontSize: 19,
                                              color: ArgonColors.text),
                                        ),
                                      ),
                                    ))
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                              child: RaisedButton(
                                textColor: ArgonColors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                                onPressed: () {
                                  activateLocation();
                                },
                                child: Text('Modification',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16.0)),
                                color: Colors.blue,
                              ),
                            ),
                            RaisedButton(
                              textColor: ArgonColors.white,
                              color: ArgonColors.warning,
                              onPressed: () {
                                _confirmDialog();
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              child: Text('Suppression',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16.0)),
                            )
                          ],
                        ),
                      ),
                    ],
                  ))),
        ),
      ),
    );
  }

  _navigateToEditScreen(BuildContext context, Pharmacies pharmacies) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditDataPharmacie(pharmacies)),
    );
  }

  Future<void> _confirmDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Warning!'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Are you sure want delete this item?'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Yes'),
              onPressed: () {
                api.deletePharmacie(widget.pharmacies.id);
                Navigator.pushReplacementNamed(context, '/pharmacies');
              },
            ),
            FlatButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
