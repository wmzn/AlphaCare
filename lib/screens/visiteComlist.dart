import 'package:argon_flutter/constants/Theme.dart';
import 'package:argon_flutter/screens/detailvisitesCom.dart';
import 'package:argon_flutter/widgets/drawer.dart';
import 'package:argon_flutter/widgets/navbar.dart';
import 'package:flutter/material.dart';
import 'package:argon_flutter/models/VisiteCom.dart';
import 'detailwidget.dart';

class VisitesComList extends StatelessWidget {
  final List<VisiteCom> visiteCom;
  VisitesComList({Key key, this.visiteCom}) : super(key: key);
  TextEditingController editingController = TextEditingController();
  void initState() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ArgonColors.bgColorScreen,
        drawer: ArgonDrawer(currentPage: "Elements"),
        body: Container(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: visiteCom == null ? 0 : visiteCom.length,
                    itemBuilder: (BuildContext context, int index) {
                      String toshow = " ";
                      Color color;
                      if (visiteCom[index].V9 == "1") {
                        toshow = "Rapport validé";
                        color = ArgonColors.success;
                      } else if (visiteCom[index].V9 == "2") {
                        toshow = "Rapport non validé";
                        color = ArgonColors.error;
                      }
                      return Card(
                          color: Colors.white,
                          margin: EdgeInsets.all(10.0),
                          shadowColor: Colors.green,
                          elevation: 10.0,
                          child: InkWell(
                            onTap: () {
                              print(visiteCom[index]);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        DetailVisiteCom(visiteCom[index])),
                              );
                            },
                            child: ListTile(
                              leading:
                              Icon(Icons.person, color: ArgonColors.success),
                              title: Text(visiteCom[index].NomPharmacie),
                              subtitle: Text(
                                toshow + " \n" + visiteCom[index].date.split(" ")[0],
                                style: TextStyle(fontSize: 14, color: color),
                              ),
                            ),
                          ));
                    }),
              )
            ],
          ),
        ));
  }
}
