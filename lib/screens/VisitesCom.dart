import 'package:argon_flutter/screens/AddvisiteCom.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:argon_flutter/constants/Theme.dart';
import 'package:argon_flutter/screens/adddatawidget.dart';
import 'package:argon_flutter/models/Visite.dart';
import 'package:argon_flutter/models/VisiteCom.dart';
import 'package:argon_flutter/services/VisiteCom_service.dart';
import 'package:argon_flutter/screens/VisiteComList.dart';
//widgets
import 'package:argon_flutter/widgets/navbar.dart';
import 'package:argon_flutter/widgets/drawer.dart';
import 'package:argon_flutter/widgets/input.dart';
import 'package:argon_flutter/widgets/table-cell.dart';
import 'package:getwidget/components/toast/gf_toast.dart';
import 'package:location/location.dart';

class VisitesCom extends StatefulWidget {
  @override
  _VisitesComState createState() => _VisitesComState();
}

class _VisitesComState extends State<VisitesCom> {
  final ApiVisiteComService api = ApiVisiteComService();
  List<VisiteCom> visitesComList;
  TextEditingController editingController = TextEditingController();
  Location _location = Location();
  void activateLocation() async {
    await _location.requestPermission();
    if (await _location.hasPermission() == PermissionStatus.granted) {
      _navigateToAddScreen(context);
    } else {
      GFToast.showToast(
        'Il est nécessaire d\'activer la permission',
        context,
      );
    }
  }

  bool switchValueOne;
  bool switchValueTwo;
  bool _serviceEnabled;

  void initState() {
    setState(() {
      switchValueOne = true;
      switchValueTwo = false;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (visitesComList == null) {
      visitesComList = List<VisiteCom>();
    }
    return Scaffold(
      appBar: Navbar(
        title: "Visite Commerciale",
      ),
      backgroundColor: ArgonColors.bgColorScreen,
      drawer: ArgonDrawer(currentPage: "VisiteCom"),
      body: new Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  filterSearchResults(value);
                },
                controller: editingController,
                decoration: InputDecoration(
                    hintStyle: TextStyle(
                      color: ArgonColors.success,
                    ),
                    labelStyle: TextStyle(
                      color: ArgonColors.text,
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(
                            color: ArgonColors.success,
                            width: 1.0,
                            style: BorderStyle.solid)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(
                            color: ArgonColors.success,
                            width: 1.0,
                            style: BorderStyle.solid)),
                    labelText: "Recherche ",
                    hintText: "Recherche",
                    prefixIcon: Icon(
                      Icons.search,
                      color: ArgonColors.success,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)))),
              ),
            ),
            Expanded(
              child: new Center(
                  child: new FutureBuilder(
                    future: loadList(),
                    builder: (context, snapshot) {
                      return visitesComList.length > 0
                          ? new VisitesComList(visiteCom: visitesComList)
                          : new Center(
                          child: new Text('Pas d\'information',
                              style: Theme.of(context).textTheme.title));
                    },
                  )),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          activateLocation();
        },
        backgroundColor: ArgonColors.success,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  void filterSearchResults(String query) {
    // print("\x1B[31mdouble\x1B[0m");

    // print("\x1B[31m$duplicateItems\x1B[0m");

    List<VisiteCom> dummySearchList;
    dummySearchList = visitesComList;

    if (query.isNotEmpty) {
      List<VisiteCom> dummyListData = List<VisiteCom>();

      dummySearchList.forEach((item) {
        if (item.Rapport.contains(query)) {
          print("\x1B[31m$query\x1B[0m");

          dummyListData.add(item);
        }

        setState(() {
          this.visitesComList = dummyListData;

          // print("\x1B[31m$dummyListData\x1B[0m");
        });
      });
      print(dummyListData);
      return;
    } else {}
  }

  Future loadList() {
    Future<List<VisiteCom>> futureCases = api.getVisitesCom();
    futureCases.then((visitesComList) {
      setState(() {
        this.visitesComList = visitesComList;
        filterSearchResults(editingController.text);
      });
    });
    return futureCases;
  }

  _navigateToAddScreen(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddVisiteCom()),
    );
  }
}
