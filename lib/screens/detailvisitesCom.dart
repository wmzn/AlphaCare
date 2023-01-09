import 'package:argon_flutter/models/VisiteCom.dart';
import 'package:argon_flutter/screens/editvisiteCom.dart';
import 'package:argon_flutter/services/VisiteCom_service.dart';
import 'package:argon_flutter/widgets/navbar.dart';
import 'package:flutter/material.dart';
import 'package:argon_flutter/services/api_service.dart';
import 'package:argon_flutter/constants/Theme.dart';
import 'package:getwidget/components/toast/gf_toast.dart';
import 'package:location/location.dart';

class DetailVisiteCom extends StatefulWidget {
  DetailVisiteCom(this.visitCom);

  final VisiteCom visitCom;

  @override
  _DetailVisiteComState createState() => _DetailVisiteComState();
}

class _DetailVisiteComState extends State<DetailVisiteCom> {
  _DetailVisiteComState();
  Location _location = Location();
  void activateLocation() async {
    await _location.requestPermission();
    if (await _location.hasPermission() == PermissionStatus.granted) {
      _navigateToEditScreen(context, widget.visitCom);
    } else {
      GFToast.showToast(
        'Il est nécessaire d\'activer la permission',
        context,
      );
    }
  }

  final ApiVisiteComService api = ApiVisiteComService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(
          title: "Detaille Visite Commerciale",
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
                                Icon(Icons.list_alt,
                                    color: ArgonColors.success),
                                if (widget.visitCom.V9 == "1")
                                  Padding(
                                    padding: const EdgeInsets.only(top: 0.0),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        " Etat de rapport :" + " Validé",
                                        style: TextStyle(
                                            fontSize: 19,
                                            color: ArgonColors.text),
                                      ),
                                    ),
                                  )
                                else if (widget.visitCom.V9 == "2")
                                  Padding(
                                    padding: const EdgeInsets.only(top: 0.0),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        " Etat de rapport  :" + " Non Validé",
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
                                Icon(Icons.list_alt,
                                    color: ArgonColors.success),
                                Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 0.0),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "  Observation  :" + widget.visitCom.Rapport,
                                          maxLines: 5,
                                          style: TextStyle(
                                              fontSize: 16,
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
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: [
                                Icon(Icons.block_sharp,
                                    color: ArgonColors.success),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 0.0),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "  Produit 01  : " + widget.visitCom.Medicament1,
                                        maxLines: 5,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: ArgonColors.text),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 0.0),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "           Qte Disponible  : " + widget.visitCom.Dispo1,
                                        maxLines: 5,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: ArgonColors.text),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 0.0),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "           Qte Rotation  : " + widget.visitCom.Rotation1,
                                        maxLines: 5,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: ArgonColors.text),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 0.0),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "           Qte Commande  : " + widget.visitCom.Commande1,
                                        maxLines: 5,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: ArgonColors.text),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: [
                                Icon(Icons.block_sharp,
                                    color: ArgonColors.success),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 0.0),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "  Produit 02  : " + widget.visitCom.Medicament2,
                                        maxLines: 5,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: ArgonColors.text),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 0.0),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "           Qte Disponible  : " + widget.visitCom.Dispo2,
                                        maxLines: 5,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: ArgonColors.text),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 0.0),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "           Qte Rotation  : " + widget.visitCom.Rotation2,
                                        maxLines: 5,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: ArgonColors.text),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 0.0),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "           Qte Commande  : " + widget.visitCom.Commande2,
                                        maxLines: 5,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: ArgonColors.text),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: [
                                Icon(Icons.block_sharp,
                                    color: ArgonColors.success),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 0.0),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "  Produit 03  : " + widget.visitCom.Medicament3,
                                        maxLines: 5,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: ArgonColors.text),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 0.0),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "           Qte Disponible  : " + widget.visitCom.Dispo3,
                                        maxLines: 5,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: ArgonColors.text),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 0.0),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "           Qte Rotation  : " + widget.visitCom.Rotation3,
                                        maxLines: 5,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: ArgonColors.text),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 0.0),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "           Qte Commande  : " + widget.visitCom.Commande3,
                                        maxLines: 5,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: ArgonColors.text),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: [
                                Icon(Icons.block_sharp,
                                    color: ArgonColors.success),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 0.0),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "  Produit 04  : " + widget.visitCom.Medicament4,
                                        maxLines: 5,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: ArgonColors.text),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 0.0),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "           Qte Disponible  : " + widget.visitCom.Dispo4,
                                        maxLines: 5,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: ArgonColors.text),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 0.0),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "           Qte Rotation  : " + widget.visitCom.Rotation4,
                                        maxLines: 5,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: ArgonColors.text),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 0.0),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "           Qte Commande  : " + widget.visitCom.Commande4,
                                        maxLines: 5,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: ArgonColors.text),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: [
                                Icon(Icons.block_sharp,
                                    color: ArgonColors.success),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 0.0),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "  Produit 05  : " + widget.visitCom.Medicament5,
                                        maxLines: 5,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: ArgonColors.text),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 0.0),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "           Qte Disponible  : " + widget.visitCom.Dispo5,
                                        maxLines: 5,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: ArgonColors.text),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 0.0),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "           Qte Rotation  : " + widget.visitCom.Rotation5,
                                        maxLines: 5,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: ArgonColors.text),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 0.0),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "           Qte Commande  : " + widget.visitCom.Commande5,
                                        maxLines: 5,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: ArgonColors.text),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: [
                                Icon(Icons.block_sharp,
                                    color: ArgonColors.success),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 0.0),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "  Produit 06  : " + widget.visitCom.Medicament6,
                                        maxLines: 5,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: ArgonColors.text),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 0.0),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "           Qte Disponible  : " + widget.visitCom.Dispo6,
                                        maxLines: 5,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: ArgonColors.text),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 0.0),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "           Qte Rotation  : " + widget.visitCom.Rotation6,
                                        maxLines: 5,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: ArgonColors.text),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 0.0),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "           Qte Commande  : " + widget.visitCom.Commande6,
                                        maxLines: 5,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: ArgonColors.text),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: [
                                Icon(Icons.block_sharp,
                                    color: ArgonColors.success),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 0.0),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "  Produit 07  : " + widget.visitCom.Medicament7,
                                        maxLines: 5,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: ArgonColors.text),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 0.0),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "           Qte Disponible  : " + widget.visitCom.Dispo7,
                                        maxLines: 5,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: ArgonColors.text),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 0.0),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "           Qte Rotation  : " + widget.visitCom.Rotation7,
                                        maxLines: 5,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: ArgonColors.text),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 0.0),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "           Qte Commande  : " + widget.visitCom.Commande7,
                                        maxLines: 5,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: ArgonColors.text),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: [
                                Icon(Icons.block_sharp,
                                    color: ArgonColors.success),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 0.0),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "  Produit 08  : " + widget.visitCom.Medicament8,
                                        maxLines: 5,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: ArgonColors.text),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 0.0),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "           Qte Disponible  : " + widget.visitCom.Dispo8,
                                        maxLines: 5,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: ArgonColors.text),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 0.0),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "           Qte Rotation  : " + widget.visitCom.Rotation8,
                                        maxLines: 5,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: ArgonColors.text),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 0.0),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "           Qte Commande  : " + widget.visitCom.Commande8,
                                        maxLines: 5,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: ArgonColors.text),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: [
                                Icon(Icons.block_sharp,
                                    color: ArgonColors.success),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 0.0),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "  Produit 09  : " + widget.visitCom.Medicament9,
                                        maxLines: 5,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: ArgonColors.text),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 0.0),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "           Qte Disponible  : " + widget.visitCom.Dispo9,
                                        maxLines: 5,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: ArgonColors.text),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 0.0),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "           Qte Rotation  : " + widget.visitCom.Rotation9,
                                        maxLines: 5,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: ArgonColors.text),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 0.0),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "           Qte Commande  : " + widget.visitCom.Commande9,
                                        maxLines: 5,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: ArgonColors.text),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: [
                                Icon(Icons.block_sharp,
                                    color: ArgonColors.success),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 0.0),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "  Produit 10  : " + widget.visitCom.Medicament10,
                                        maxLines: 5,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: ArgonColors.text),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 0.0),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "           Qte Disponible  : " + widget.visitCom.Dispo10,
                                        maxLines: 5,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: ArgonColors.text),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 0.0),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "           Qte Rotation  : " + widget.visitCom.Rotation10,
                                        maxLines: 5,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: ArgonColors.text),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 0.0),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "           Qte Commande  : " + widget.visitCom.Commande10,
                                        maxLines: 5,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: ArgonColors.text),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: [
                                Icon(Icons.block_sharp,
                                    color: ArgonColors.success),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 0.0),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "  Produit 11  : " + widget.visitCom.Medicament11,
                                        maxLines: 5,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: ArgonColors.text),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 0.0),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "           Qte Disponible  : " + widget.visitCom.Dispo11,
                                        maxLines: 5,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: ArgonColors.text),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 0.0),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "           Qte Rotation  : " + widget.visitCom.Rotation11,
                                        maxLines: 5,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: ArgonColors.text),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 0.0),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "           Qte Commande  : " + widget.visitCom.Commande11,
                                        maxLines: 5,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: ArgonColors.text),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: [
                                Icon(Icons.block_sharp,
                                    color: ArgonColors.success),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 0.0),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "  Produit 12  : " + widget.visitCom.Medicament12,
                                        maxLines: 5,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: ArgonColors.text),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 0.0),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "           Qte Disponible  : " + widget.visitCom.Dispo12,
                                        maxLines: 5,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: ArgonColors.text),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 0.0),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "           Qte Rotation  : " + widget.visitCom.Rotation12,
                                        maxLines: 5,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: ArgonColors.text),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 0.0),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "           Qte Commande  : " + widget.visitCom.Commande12,
                                        maxLines: 5,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: ArgonColors.text),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
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

  _navigateToEditScreen(BuildContext context, VisiteCom visitCom) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditVisiteCom(visitCom)),
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
                api.deleteVisiteCom(widget.visitCom.id);
                Navigator.pushReplacementNamed(context, '/VisiteCom');
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
