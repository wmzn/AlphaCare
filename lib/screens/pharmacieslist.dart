import 'package:argon_flutter/constants/Theme.dart';
import 'package:argon_flutter/screens/detailpharmacie.dart';
import 'package:argon_flutter/widgets/drawer.dart';
import 'package:argon_flutter/widgets/navbar.dart';
import 'package:flutter/material.dart';
import 'package:argon_flutter/models/pharmacie.dart';
import 'detailwidget.dart';

class PharmaciesList extends StatelessWidget {
  final List<Pharmacies> pharmacies;

  PharmaciesList({Key key, this.pharmacies}) : super(key: key);
  TextEditingController editingController = TextEditingController();
  void initState() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ArgonColors.bgColorScreen,
        drawer: ArgonDrawer(currentPage: "Pharmacies"),
        body: Container(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: pharmacies == null ? 0 : pharmacies.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                          color: Colors.white,
                          margin: EdgeInsets.all(10.0),
                          shadowColor: Colors.green,
                          elevation: 10.0,
                          child: InkWell(
                            onTap: () {
                              print(pharmacies[index]);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        DetailPharmacie(pharmacies[index])),
                              );
                            },
                            child: ListTile(
                              leading:
                              Icon(Icons.person, color: ArgonColors.success),
                              title: Text(
                                  pharmacies[index].NomPharmacie),
                              subtitle: Text(pharmacies[index].Phone),
                            ),
                          ));
                    }),
              )
            ],
          ),
        ));
  }
}
