import 'package:argon_flutter/models/VisiteCom.dart';
import 'package:argon_flutter/services/Pharmacie_service.dart';
import 'package:argon_flutter/services/VisiteCom_service.dart';
import 'package:flutter/material.dart';
import 'package:argon_flutter/services/Pharmacie_service.dart';
import 'package:argon_flutter/models/pharmacie.dart';
import 'package:argon_flutter/widgets/card-horizontal.dart';
import 'package:argon_flutter/widgets/navbar.dart';
import 'package:argon_flutter/screens/EditVisite.dart';
import 'package:argon_flutter/constants/Theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:argon_flutter/widgets/input.dart';
import 'package:argon_flutter/widgets/inputNumber.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:argon_flutter/widgets/drawer.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:location/location.dart';
import 'package:geocoder/geocoder.dart';
import 'package:search_choices/search_choices.dart';
import 'package:getwidget/getwidget.dart';

enum Gender { male, female }
enum Status { positive, dead, recovered }

class EditVisiteCom extends StatefulWidget {
  EditVisiteCom(this.visitCom);

  final VisiteCom visitCom;

  @override
  _EditVisiteComState createState() => _EditVisiteComState();
}

class _EditVisiteComState extends State<EditVisiteCom> {
  LatLng _initialcameraposition = LatLng(20.5937, 78.9629);
  GoogleMapController _controller;
  Location _location = Location();
  var _Phone = TextEditingController();
  var _Spicialite = TextEditingController();
  var _Secteur = TextEditingController();
  var _NomPharmacie = TextEditingController();
  var _NomContact = TextEditingController();
  final ApiVisiteComService api = ApiVisiteComService();
  final _addFormKey = GlobalKey<FormState>();
  String gender = 'male';
  Gender _gender = Gender.male;
  final _ageController = TextEditingController();
  final _addressController = TextEditingController();
  final _cityController = TextEditingController();
  final _countryController = TextEditingController();
  final Set<Marker> _markers = {};

  var _selectedPlace;
  Key Header1;
  String _mapController = 'false';
  bool selectedmap = true;
  bool selectedmap2 = false;
  String _Wilaya = '';
  String _Daira = '';
  String _Route = '';
  String _Pcode = '';
  String id = '';

  var kInitialPosition = LatLng(-33.8567844, 151.213108);
  String _Commune = '';
  String status = 'positive';
  Status _status = Status.positive;
  static String selectedValueSingleDialog;
  static String selectedValueSingleDialog2;
  static String selectedValueSingleDialog3;

  final PharmacieService api2 = PharmacieService();

  int groupValue = 0;
  int groupValue2 = 0;
  var _rapport = TextEditingController();
  var _ob = TextEditingController();
  var _Medicament1 = TextEditingController(text: "ASCOZINC");
  var _Medicament2 = TextEditingController(text: "BIOPROPOLISC+");
  var _Medicament3 = TextEditingController(text: "CALMAZEN");
  var _Medicament4 = TextEditingController(text: "SERENOX");
  var _Medicament5 = TextEditingController(text: "TAMAREL");
  var _Medicament6 = TextEditingController(text: "COLLAGENCARE+");
  var _Medicament7 = TextEditingController(text: "NUTRIFERB9-C");
  var _Medicament8 = TextEditingController(text: "Vitamine E200");
  var _Medicament9 = TextEditingController(text: "NUTRI C");
  var _Medicament10 = TextEditingController(text: "NUTRID 1000UI");
  var _Medicament11 = TextEditingController(text: "NUTRI D 50 000UI");
  var _Medicament12 = TextEditingController(text: "MAXICAL D3");
  var _Dispo1 = TextEditingController();
  var _Dispo2 = TextEditingController();
  var _Dispo3 = TextEditingController();
  var _Dispo4 = TextEditingController();
  var _Dispo5 = TextEditingController();
  var _Dispo6 = TextEditingController();
  var _Dispo7 = TextEditingController();
  var _Dispo8 = TextEditingController();
  var _Dispo9 = TextEditingController();
  var _Dispo10 = TextEditingController();
  var _Dispo11 = TextEditingController();
  var _Dispo12 = TextEditingController();
  var _Rotation1 = TextEditingController();
  var _Rotation2 = TextEditingController();
  var _Rotation3 = TextEditingController();
  var _Rotation4 = TextEditingController();
  var _Rotation5 = TextEditingController();
  var _Rotation6 = TextEditingController();
  var _Rotation7 = TextEditingController();
  var _Rotation8 = TextEditingController();
  var _Rotation9 = TextEditingController();
  var _Rotation10 = TextEditingController();
  var _Rotation11 = TextEditingController();
  var _Rotation12 = TextEditingController();
  var _Commande1 = TextEditingController();
  var _Commande2 = TextEditingController();
  var _Commande3 = TextEditingController();
  var _Commande4 = TextEditingController();
  var _Commande5 = TextEditingController();
  var _Commande6 = TextEditingController();
  var _Commande7 = TextEditingController();
  var _Commande8 = TextEditingController();
  var _Commande9 = TextEditingController();
  var _Commande10 = TextEditingController();
  var _Commande11 = TextEditingController();
  var _Commande12 = TextEditingController();

  int groupValue3 = 0;

  int groupValue4 = 0;

  int groupValue5 = 0;

  int groupValue6 = 0;

  int groupValue7 = 0;
  int groupValue8 = 0;
  int groupValue9 = 0;
  List<Pharmacies> pharmaciesList;
  final List<DropdownMenuItem> items = [];

Future loadList() {
    Future<List<Pharmacies>> futurePharmacies = api2.getPharmacies();
    futurePharmacies.then((pharmaciesList) {
      setState(() {
        this.pharmaciesList = pharmaciesList;
      });
      pharmaciesList.forEach((word) {
        items.add(DropdownMenuItem(
          child: Text(word.NomPharmacie),
          value: word.id + "," + word.NomPharmacie,
        ));
      });
    });
    return futurePharmacies;
  }

  String _lat = "0";
  String _lng = "0";

  @override
  void initState() {
    print("lat");
    print(widget.visitCom.Lat);
    id = widget.visitCom.id;
    _NomPharmacie.text = widget.visitCom.NomPharmacie;
    selectedValueSingleDialog3 = widget.visitCom.NomPharmacie;
    selectedValueSingleDialog2 = widget.visitCom.NomPharmacie;
    selectedValueSingleDialog = widget.visitCom.NomPharmacieid;
    _lat = widget.visitCom.Lat;
    _lng = widget.visitCom.Lng;
    groupValue = int.parse(widget.visitCom.V1);
    groupValue2 = int.parse(widget.visitCom.V2);
    groupValue3 = int.parse(widget.visitCom.V3);
    groupValue4 = int.parse(widget.visitCom.V4);
    groupValue5 = int.parse(widget.visitCom.V5);
    groupValue6 = int.parse(widget.visitCom.V6);
    groupValue7 = int.parse(widget.visitCom.V7);
    groupValue8 = int.parse(widget.visitCom.V8);
    groupValue9 = int.parse(widget.visitCom.V9);
    _rapport.text = widget.visitCom.Rapport;

    _NomContact.text = widget.visitCom.V2;
    _Phone.text = widget.visitCom.V3;

    _onAddMarkerButtonPressed(LatLng(double.parse("0.0"), double.parse("0.0")));

    super.initState();
  }

  void _onMapCreated(GoogleMapController _cntlr) {
    _controller = _cntlr;
    _location.onLocationChanged.listen((l) {
      setState(() {
        _markers.add(Marker(
          // This marker id can be anything that uniquely identifies each marker.
          markerId: MarkerId("12"),
          position: LatLng(double.parse(_lat), double.parse(_lng)),
          infoWindow: InfoWindow(

            //  snippet: '5 Star Rating',
          ),
          icon: BitmapDescriptor.defaultMarker,
        ));
      });
      _controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(l.latitude, l.longitude), zoom: 15),
        ),
      );
    });
  }

  void _onAddMarkerButtonPressed(LatLng latlang) {
    print("ok2");
    print(latlang);
    setState(() {
      _markers.add(Marker(
        // This marker id can be anything that uniquely identifies each marker.
        markerId: MarkerId("12"),
        position: latlang,
        infoWindow: InfoWindow(

          //  snippet: '5 Star Rating',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));
    });
  }

  Map<MarkerId, Marker> markers = <MarkerId, Marker>{
    MarkerId('marker_id_1'): Marker(
      markerId: MarkerId('marker_id_1'),
      position: LatLng(30.0444, 31.235),
      infoWindow: InfoWindow(title: 'marker_id_1', snippet: '*'),
      onTap: () {
        //_onMarkerTapped(markerId);
        print('Marker Tapped');
      },
      onDragEnd: (LatLng position) {
        print('Drag Ended');
      },
    )
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(
          title: "Modification  Visite Commerciale",
          rightOptions: false,
          backButton: true,
          transparent: false,
          bgColor: ArgonColors.success),
      backgroundColor: ArgonColors.bgColorScreen,
      drawer: ArgonDrawer(currentPage: "pharmacies"),
      body: Form(
        key: _addFormKey,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10.0),
            child: Card(
                child: Container(
                    padding: EdgeInsets.all(10.0),
                    width: 440,
                    child: Column(
                      children: <Widget>[
                        /********************************************* */
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text("Point de Vente",
                                    style: TextStyle(
                                        color: ArgonColors.text,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 12.0),
                                child: SearchChoices.single(
                                  style: TextStyle(
                                      height: 0.85,
                                      fontSize: 14.0,
                                      color: ArgonColors.initial),
                                  items: items,
                                  value: selectedValueSingleDialog3,
                                  hint: " Non autorisé",
                                  searchHint: "non autorisé",
                                  underline: Container(
                                    height: 1.0,
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.teal,
                                                width: 3.0))),
                                  ),
                                  iconEnabledColor: Colors.indigo,
                                  onChanged: (value) {
                                    print("hy");
                                    selectedValueSingleDialog3 = value;
                                    print(value.split(",")[0]);
                                    setState(() {
                                      selectedValueSingleDialog =
                                      value.split(",")[0];
                                      selectedValueSingleDialog2 =
                                      value.split(",")[1];
                                    });
                                  },
                                  isExpanded: true,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text("Observation",
                                    style: TextStyle(
                                        color: ArgonColors.text,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 12.0),
                                child: Input(
                                  min: 5,
                                  max: 3000,
                                  controller: _rapport,
                                  placeholder: "Observation",
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text("Etat",
                                    style: TextStyle(
                                        color: ArgonColors.text,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 12.0),
                                child: GFCard(
                                    content: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Text("Validé",
                                            style: TextStyle(
                                                color: ArgonColors.text,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12)),
                                        GFRadio(
                                          type: GFRadioType.square,
                                          size: GFSize.LARGE,
                                          value: 1,
                                          groupValue: groupValue9,
                                          onChanged: (value) {
                                            setState(() {
                                              groupValue9 = value;
                                            });
                                          },
                                          inactiveIcon: null,
                                          activeBorderColor: GFColors.SUCCESS,
                                          radioColor: GFColors.SUCCESS,
                                        ),
                                        Text("Non validé",
                                            style: TextStyle(
                                                color: ArgonColors.text,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12)),
                                        GFRadio(
                                          type: GFRadioType.square,
                                          size: GFSize.LARGE,
                                          value: 2,
                                          groupValue: groupValue9,
                                          onChanged: (value) {
                                            setState(() {
                                              groupValue9 = value;
                                            });
                                          },
                                          inactiveIcon: null,
                                          activeBorderColor: GFColors.DANGER,
                                          radioColor: GFColors.DANGER,
                                        ),
                                      ],
                                    )),
                              ),
                            ],
                          ),
                        ),
                        // Padding(
                        //   padding: EdgeInsets.only(top: 50.0),
                        //   child: Container(
                        //       height: MediaQuery.of(context).size.height / 1.5,
                        //       child: Column(children: <Widget>[
                        //         Container(
                        //           height:
                        //           MediaQuery.of(context).size.height / 1.5 -
                        //               25,
                        //           child: GoogleMap(
                        //             gestureRecognizers: Set()
                        //               ..add(
                        //                   Factory<OneSequenceGestureRecognizer>(
                        //                           () => EagerGestureRecognizer())),
                        //             initialCameraPosition: CameraPosition(
                        //                 target: _initialcameraposition),
                        //             mapType: MapType.normal,
                        //             onMapCreated: _onMapCreated,
                        //             myLocationEnabled: true,
                        //             onTap: (latlang) async {
                        //               print("ok");
                        //               if (_markers.length >= 1) {
                        //                 _markers.clear();
                        //               }
                        //               selectedmap = true;
                        //               _onAddMarkerButtonPressed(latlang);
                        //
                        //               final coordinates = new Coordinates(
                        //                   latlang.latitude, latlang.longitude);
                        //               var selectedPlace1 = await Geocoder.local
                        //                   .findAddressesFromCoordinates(
                        //                   coordinates);
                        //               var selectedPlace = selectedPlace1.first;
                        //               print(
                        //                   selectedPlace.coordinates.longitude);
                        //               setState(() {
                        //                 _selectedPlace = selectedPlace;
                        //                 _Daira = selectedPlace.locality;
                        //                 _Wilaya = selectedPlace.adminArea;
                        //                 _Commune = selectedPlace.subAdminArea;
                        //                 _Route = selectedPlace.addressLine;
                        //                 if (selectedPlace.postalCode != null) {
                        //                   _Pcode = selectedPlace.postalCode;
                        //                 } else {
                        //                   _Pcode = '';
                        //                 }
                        //               });
                        //             },
                        //             markers: _markers,
                        //           ),
                        //         ),
                        //         if (selectedmap2)
                        //           Align(
                        //             alignment: Alignment.centerLeft,
                        //             child: Text("selection sur la map",
                        //                 style: TextStyle(
                        //                     color: ArgonColors.error,
                        //                     fontWeight: FontWeight.w600,
                        //                     fontSize: 12)),
                        //           ),
                        //       ])),
                        // ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: [
                              Card(
                                color: HexColor('#f5fce2'),
                                margin: EdgeInsets.all(10.0),
                                shadowColor: Colors.green,
                                elevation: 20.0,
                                child: Column(
                                  children: <Widget>[
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text("Produit O1",
                                          style: TextStyle(
                                              color: ArgonColors.text,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 12.0),
                                      child: SizedBox(
                                        width: 275,
                                        child: TextFormField(
                                          controller: _Medicament1,
                                          enabled: false,
                                          decoration: InputDecoration(
                                            hintText: 'ASCOZINC',
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 12.0),
                                      child: SizedBox(
                                        width: 275,
                                        child: TextFormField(
                                          controller: _Dispo1,
                                          enabled: true,
                                          keyboardType: TextInputType.numberWithOptions(),
                                          decoration: InputDecoration(
                                            hintText: 'Qte Disponible',
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 12.0),
                                      child: SizedBox(
                                        width: 275,
                                        child: TextFormField(
                                          controller: _Rotation1,
                                          enabled: true,
                                          keyboardType: TextInputType.numberWithOptions(),
                                          decoration: InputDecoration(
                                            hintText: 'Qte Rotation',
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 12.0),
                                      child: SizedBox(
                                        width: 275,
                                        child: TextFormField(
                                          controller: _Commande1,
                                          enabled: true,
                                          keyboardType: TextInputType.numberWithOptions(),
                                          decoration: InputDecoration(
                                            hintText: 'Qte Commande',
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height:10),
                                  ],
                                ),
                              ),
                              Divider(
                                color: Colors.green,
                                height: 2,
                                indent: 20,
                                endIndent: 20,
                                thickness: 5,
                              ),
                              Card(
                                color: Colors.white,
                                margin: EdgeInsets.all(10.0),
                                shadowColor: Colors.green,
                                elevation: 20.0,
                                child: Column(
                                  children: <Widget>[
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text("Produit O2",
                                          style: TextStyle(
                                              color: ArgonColors.text,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 12.0),
                                      child: SizedBox(
                                        width: 275,
                                        child: TextFormField(
                                          controller: _Medicament2,
                                          enabled: false,
                                          decoration: InputDecoration(
                                            hintText: 'BIOPROPOLISC+',
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 12.0),
                                      child: SizedBox(
                                        width: 275,
                                        child: TextFormField(
                                          controller: _Dispo2,
                                          enabled: true,
                                          keyboardType: TextInputType.numberWithOptions(),
                                          decoration: InputDecoration(
                                            hintText: 'Qte Disponible',
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 12.0),
                                      child: SizedBox(
                                        width: 275,
                                        child: TextFormField(
                                          controller: _Rotation2,
                                          enabled: true,
                                          keyboardType: TextInputType.numberWithOptions(),
                                          decoration: InputDecoration(
                                            hintText: 'Qte Rotation',
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 12.0),
                                      child: SizedBox(
                                        width: 275,
                                        child: TextFormField(
                                          controller: _Commande2,
                                          enabled: true,
                                          keyboardType: TextInputType.numberWithOptions(),
                                          decoration: InputDecoration(
                                            hintText: 'Qte Commande',
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height:10),
                                  ],
                                ),
                              ),
                              Divider(
                                color: Colors.green,
                                height: 2,
                                indent: 20,
                                endIndent: 20,
                                thickness: 5,
                              ),
                              Card(
                                color: HexColor('#f5fce2'),
                                margin: EdgeInsets.all(10.0),
                                shadowColor: Colors.green,
                                elevation: 20.0,
                                child: Column(
                                  children: <Widget>[
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text("Produit O3",
                                          style: TextStyle(
                                              color: ArgonColors.text,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 12.0),
                                      child: SizedBox(
                                        width: 275,
                                        child: TextFormField(
                                          controller: _Medicament3,
                                          enabled: false,
                                          decoration: InputDecoration(
                                            hintText: 'CALMAZEN',
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 12.0),
                                      child: SizedBox(
                                        width: 275,
                                        child: TextFormField(
                                          controller: _Dispo3,
                                          enabled: true,
                                          keyboardType: TextInputType.numberWithOptions(),
                                          decoration: InputDecoration(
                                            hintText: 'Qte Disponible',
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 12.0),
                                      child: SizedBox(
                                        width: 275,
                                        child: TextFormField(
                                          controller: _Rotation3,
                                          enabled: true,
                                          keyboardType: TextInputType.numberWithOptions(),
                                          decoration: InputDecoration(
                                            hintText: 'Qte Rotation',
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 12.0),
                                      child: SizedBox(
                                        width: 275,
                                        child: TextFormField(
                                          controller: _Commande3,
                                          enabled: true,
                                          keyboardType: TextInputType.numberWithOptions(),
                                          decoration: InputDecoration(
                                            hintText: 'Qte Commande',
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height:10),
                                  ],
                                ),
                              ),
                              Divider(
                                color: Colors.green,
                                height: 2,
                                indent: 20,
                                endIndent: 20,
                                thickness: 5,
                              ),
                              Card(
                                color: Colors.white,
                                margin: EdgeInsets.all(10.0),
                                shadowColor: Colors.green,
                                elevation: 20.0,
                                child: Column(
                                  children: <Widget>[
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text("Produit O4",
                                          style: TextStyle(
                                              color: ArgonColors.text,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 12.0),
                                      child: SizedBox(
                                        width: 275,
                                        child: TextFormField(
                                          controller: _Medicament4,
                                          enabled: false,
                                          decoration: InputDecoration(
                                            hintText: 'SERENOX',
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 12.0),
                                      child: SizedBox(
                                        width: 275,
                                        child: TextFormField(
                                          controller: _Dispo4,
                                          enabled: true,
                                          keyboardType: TextInputType.numberWithOptions(),
                                          decoration: InputDecoration(
                                            hintText: 'Qte Disponible',
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 12.0),
                                      child: SizedBox(
                                        width: 275,
                                        child: TextFormField(
                                          controller: _Rotation4,
                                          enabled: true,
                                          keyboardType: TextInputType.numberWithOptions(),
                                          decoration: InputDecoration(
                                            hintText: 'Qte Rotation',
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 12.0),
                                      child: SizedBox(
                                        width: 275,
                                        child: TextFormField(
                                          controller: _Commande4,
                                          enabled: true,
                                          keyboardType: TextInputType.numberWithOptions(),
                                          decoration: InputDecoration(
                                            hintText: 'Qte Commande',
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height:10),
                                  ],
                                ),
                              ),
                              Divider(
                                color: Colors.green,
                                height: 2,
                                indent: 20,
                                endIndent: 20,
                                thickness: 5,
                              ),
                              Card(
                                color: HexColor('#f5fce2'),
                                margin: EdgeInsets.all(10.0),
                                shadowColor: Colors.green,
                                elevation: 20.0,
                                child: Column(
                                  children: <Widget>[
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text("Produit O5",
                                          style: TextStyle(
                                              color: ArgonColors.text,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 12.0),
                                      child: SizedBox(
                                        width: 275,
                                        child: TextFormField(
                                          controller: _Medicament5,
                                          enabled: false,
                                          decoration: InputDecoration(
                                            hintText: 'TAMAREL',
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 12.0),
                                      child: SizedBox(
                                        width: 275,
                                        child: TextFormField(
                                          controller: _Dispo5,
                                          enabled: true,
                                          keyboardType: TextInputType.numberWithOptions(),
                                          decoration: InputDecoration(
                                            hintText: 'Qte Disponible',
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 12.0),
                                      child: SizedBox(
                                        width: 275,
                                        child: TextFormField(
                                          controller: _Rotation5,
                                          enabled: true,
                                          keyboardType: TextInputType.numberWithOptions(),
                                          decoration: InputDecoration(
                                            hintText: 'Qte Rotation',
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 12.0),
                                      child: SizedBox(
                                        width: 275,
                                        child: TextFormField(
                                          controller: _Commande5,
                                          enabled: true,
                                          keyboardType: TextInputType.numberWithOptions(),
                                          decoration: InputDecoration(
                                            hintText: 'Qte Commande',
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height:10),
                                  ],
                                ),
                              ),
                              Divider(
                                color: Colors.green,
                                height: 2,
                                indent: 20,
                                endIndent: 20,
                                thickness: 5,
                              ),
                              Card(
                                color: Colors.white,
                                margin: EdgeInsets.all(10.0),
                                shadowColor: Colors.green,
                                elevation: 20.0,
                                child: Column(
                                  children: <Widget>[
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text("Produit O6",
                                          style: TextStyle(
                                              color: ArgonColors.text,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 12.0),
                                      child: SizedBox(
                                        width: 275,
                                        child: TextFormField(
                                          controller: _Medicament6,
                                          enabled: false,
                                          decoration: InputDecoration(
                                            hintText: 'COLLAGENCARE+',
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 12.0),
                                      child: SizedBox(
                                        width: 275,
                                        child: TextFormField(
                                          controller: _Dispo6,
                                          enabled: true,
                                          keyboardType: TextInputType.numberWithOptions(),
                                          decoration: InputDecoration(
                                            hintText: 'Qte Disponible',
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 12.0),
                                      child: SizedBox(
                                        width: 275,
                                        child: TextFormField(
                                          controller: _Rotation6,
                                          enabled: true,
                                          keyboardType: TextInputType.numberWithOptions(),
                                          decoration: InputDecoration(
                                            hintText: 'Qte Rotation',
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 12.0),
                                      child: SizedBox(
                                        width: 275,
                                        child: TextFormField(
                                          controller: _Commande6,
                                          enabled: true,
                                          keyboardType: TextInputType.numberWithOptions(),
                                          decoration: InputDecoration(
                                            hintText: 'Qte Commande',
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height:10),
                                  ],
                                ),
                              ),
                              Divider(
                                color: Colors.green,
                                height: 2,
                                indent: 20,
                                endIndent: 20,
                                thickness: 5,
                              ),
                              Card(
                                color: HexColor('#f5fce2'),
                                margin: EdgeInsets.all(10.0),
                                shadowColor: Colors.green,
                                elevation: 20.0,
                                child: Column(
                                  children: <Widget>[
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text("Produit O7",
                                          style: TextStyle(
                                              color: ArgonColors.text,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 12.0),
                                      child: SizedBox(
                                        width: 275,
                                        child: TextFormField(
                                          controller: _Medicament7,
                                          enabled: false,
                                          decoration: InputDecoration(
                                            hintText: 'NUTRIFERB9-C',
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 12.0),
                                      child: SizedBox(
                                        width: 275,
                                        child: TextFormField(
                                          controller: _Dispo7,
                                          enabled: true,
                                          keyboardType: TextInputType.numberWithOptions(),
                                          decoration: InputDecoration(
                                            hintText: 'Qte Disponible',
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 12.0),
                                      child: SizedBox(
                                        width: 275,
                                        child: TextFormField(
                                          controller: _Rotation7,
                                          enabled: true,
                                          keyboardType: TextInputType.numberWithOptions(),
                                          decoration: InputDecoration(
                                            hintText: 'Qte Rotation',
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 12.0),
                                      child: SizedBox(
                                        width: 275,
                                        child: TextFormField(
                                          controller: _Commande7,
                                          enabled: true,
                                          keyboardType: TextInputType.numberWithOptions(),
                                          decoration: InputDecoration(
                                            hintText: 'Qte Commande',
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height:10),
                                  ],
                                ),
                              ),
                              Divider(
                                color: Colors.green,
                                height: 2,
                                indent: 20,
                                endIndent: 20,
                                thickness: 5,
                              ),
                              Card(
                                color: Colors.white,
                                margin: EdgeInsets.all(10.0),
                                shadowColor: Colors.green,
                                elevation: 20.0,
                                child: Column(
                                  children: <Widget>[
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text("Produit O8",
                                          style: TextStyle(
                                              color: ArgonColors.text,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 12.0),
                                      child: SizedBox(
                                        width: 275,
                                        child: TextFormField(
                                          controller: _Medicament8,
                                          enabled: false,
                                          decoration: InputDecoration(
                                            hintText: 'Vitamine E200',
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 12.0),
                                      child: SizedBox(
                                        width: 275,
                                        child: TextFormField(
                                          controller: _Dispo8,
                                          enabled: true,
                                          keyboardType: TextInputType.numberWithOptions(),
                                          decoration: InputDecoration(
                                            hintText: 'Qte Disponible',
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 12.0),
                                      child: SizedBox(
                                        width: 275,
                                        child: TextFormField(
                                          controller: _Rotation8,
                                          enabled: true,
                                          keyboardType: TextInputType.numberWithOptions(),
                                          decoration: InputDecoration(
                                            hintText: 'Qte Rotation',
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 12.0),
                                      child: SizedBox(
                                        width: 275,
                                        child: TextFormField(
                                          controller: _Commande8,
                                          enabled: true,
                                          keyboardType: TextInputType.numberWithOptions(),
                                          decoration: InputDecoration(
                                            hintText: 'Qte Commande',
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height:10),
                                  ],
                                ),
                              ),
                              Divider(
                                color: Colors.green,
                                height: 2,
                                indent: 20,
                                endIndent: 20,
                                thickness: 5,
                              ),
                              Card(
                                color: HexColor('#f5fce2'),
                                margin: EdgeInsets.all(10.0),
                                shadowColor: Colors.green,
                                elevation: 20.0,
                                child: Column(
                                  children: <Widget>[
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text("Produit O9",
                                          style: TextStyle(
                                              color: ArgonColors.text,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 12.0),
                                      child: SizedBox(
                                        width: 275,
                                        child: TextFormField(
                                          controller: _Medicament9,
                                          enabled: false,
                                          decoration: InputDecoration(
                                            hintText: 'NUTRI C',
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 12.0),
                                      child: SizedBox(
                                        width: 275,
                                        child: TextFormField(
                                          controller: _Dispo9,
                                          enabled: true,
                                          keyboardType: TextInputType.numberWithOptions(),
                                          decoration: InputDecoration(
                                            hintText: 'Qte Disponible',
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 12.0),
                                      child: SizedBox(
                                        width: 275,
                                        child: TextFormField(
                                          controller: _Rotation9,
                                          enabled: true,
                                          keyboardType: TextInputType.numberWithOptions(),
                                          decoration: InputDecoration(
                                            hintText: 'Qte Rotation',
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 12.0),
                                      child: SizedBox(
                                        width: 275,
                                        child: TextFormField(
                                          controller: _Commande9,
                                          enabled: true,
                                          keyboardType: TextInputType.numberWithOptions(),
                                          decoration: InputDecoration(
                                            hintText: 'Qte Commande',
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height:10),
                                  ],
                                ),
                              ),
                              Divider(
                                color: Colors.green,
                                height: 2,
                                indent: 20,
                                endIndent: 20,
                                thickness: 5,
                              ),
                              Card(
                                color: Colors.white,
                                margin: EdgeInsets.all(10.0),
                                shadowColor: Colors.green,
                                elevation: 20.0,
                                child: Column(
                                  children: <Widget>[
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text("Produit 10",
                                          style: TextStyle(
                                              color: ArgonColors.text,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 12.0),
                                      child: SizedBox(
                                        width: 275,
                                        child: TextFormField(
                                          controller: _Medicament10,
                                          enabled: false,
                                          decoration: InputDecoration(
                                            hintText: 'NUTRID 1000UI',
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 12.0),
                                      child: SizedBox(
                                        width: 275,
                                        child: TextFormField(
                                          controller: _Dispo10,
                                          enabled: true,
                                          keyboardType: TextInputType.numberWithOptions(),
                                          decoration: InputDecoration(
                                            hintText: 'Qte Disponible',
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 12.0),
                                      child: SizedBox(
                                        width: 275,
                                        child: TextFormField(
                                          controller: _Rotation10,
                                          enabled: true,
                                          keyboardType: TextInputType.numberWithOptions(),
                                          decoration: InputDecoration(
                                            hintText: 'Qte Rotation',
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 12.0),
                                      child: SizedBox(
                                        width: 275,
                                        child: TextFormField(
                                          controller: _Commande10,
                                          enabled: true,
                                          keyboardType: TextInputType.numberWithOptions(),
                                          decoration: InputDecoration(
                                            hintText: 'Qte Commande',
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height:10),
                                  ],
                                ),
                              ),
                              Divider(
                                color: Colors.green,
                                height: 2,
                                indent: 20,
                                endIndent: 20,
                                thickness: 5,
                              ),
                              Card(
                                color: HexColor('#f5fce2'),
                                margin: EdgeInsets.all(10.0),
                                shadowColor: Colors.green,
                                elevation: 20.0,
                                child: Column(
                                  children: <Widget>[
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text("Produit 11",
                                          style: TextStyle(
                                              color: ArgonColors.text,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 12.0),
                                      child: SizedBox(
                                        width: 275,
                                        child: TextFormField(
                                          controller: _Medicament11,
                                          enabled: false,
                                          decoration: InputDecoration(
                                            hintText: 'NUTRI D 50 000UI',
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 12.0),
                                      child: SizedBox(
                                        width: 275,
                                        child: TextFormField(
                                          controller: _Dispo11,
                                          enabled: true,
                                          keyboardType: TextInputType.numberWithOptions(),
                                          decoration: InputDecoration(
                                            hintText: 'Qte Disponible',
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 12.0),
                                      child: SizedBox(
                                        width: 275,
                                        child: TextFormField(
                                          controller: _Rotation11,
                                          enabled: true,
                                          keyboardType: TextInputType.numberWithOptions(),
                                          decoration: InputDecoration(
                                            hintText: 'Qte Rotation',
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 12.0),
                                      child: SizedBox(
                                        width: 275,
                                        child: TextFormField(
                                          controller: _Commande11,
                                          enabled: true,
                                          keyboardType: TextInputType.numberWithOptions(),
                                          decoration: InputDecoration(
                                            hintText: 'Qte Commande',
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height:10),
                                  ],
                                ),
                              ),
                              Divider(
                                color: Colors.green,
                                height: 2,
                                indent: 20,
                                endIndent: 20,
                                thickness: 5,
                              ),
                              Card(
                                color: Colors.white,
                                margin: EdgeInsets.all(10.0),
                                shadowColor: Colors.green,
                                elevation: 20.0,
                                child: Column(
                                  children: <Widget>[
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text("Produit 12",
                                          style: TextStyle(
                                              color: ArgonColors.text,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 12.0),
                                      child: SizedBox(
                                        width: 275,
                                        child: TextFormField(
                                          controller: _Medicament12,
                                          enabled: false,
                                          decoration: InputDecoration(
                                            hintText: 'MAXICAL D3',
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 12.0),
                                      child: SizedBox(
                                        width: 275,
                                        child: TextFormField(
                                          controller: _Dispo12,
                                          enabled: true,
                                          keyboardType: TextInputType.numberWithOptions(),
                                          decoration: InputDecoration(
                                            hintText: 'Qte Disponible',
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 12.0),
                                      child: SizedBox(
                                        width: 275,
                                        child: TextFormField(
                                          controller: _Rotation12,
                                          enabled: true,
                                          keyboardType: TextInputType.numberWithOptions(),
                                          decoration: InputDecoration(
                                            hintText: 'Qte Rotation',
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 12.0),
                                      child: SizedBox(
                                        width: 275,
                                        child: TextFormField(
                                          controller: _Commande12,
                                          enabled: true,
                                          keyboardType: TextInputType.numberWithOptions(),
                                          decoration: InputDecoration(
                                            hintText: 'Qte Commande',
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height:10),
                                  ],
                                ),
                              ),
                              Divider(
                                color: Colors.green,
                                height: 2,
                                indent: 20,
                                endIndent: 20,
                                thickness: 5,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              RaisedButton(
                                splashColor: Colors.red,
                                onPressed: () {
                                  if (selectedmap) {
                                    setState(() {
                                      selectedmap2 = false;
                                    });
                                    if (_addFormKey.currentState.validate()) {
                                      _addFormKey.currentState.save();
                                      api.updateVisiteCom(VisiteCom(
                                          id: id,
                                          NomPharmacie: selectedValueSingleDialog2,
                                          NomPharmacieid: selectedValueSingleDialog,
                                          V1: groupValue.toString(),
                                          V2: groupValue2.toString(),
                                          V3: groupValue3.toString(),
                                          V4: groupValue4.toString(),
                                          V5: groupValue5.toString(),
                                          V6: groupValue6.toString(),
                                          V7: groupValue7.toString(),
                                          V8: groupValue8.toString(),
                                          V9: groupValue9.toString(),
                                          Rapport: _rapport.text,
                                          Medicament1: _Medicament1.text,
                                          Medicament2: _Medicament2.text,
                                          Medicament3: _Medicament3.text,
                                          Medicament4: _Medicament4.text,
                                          Medicament5: _Medicament5.text,
                                          Medicament6: _Medicament6.text,
                                          Medicament7: _Medicament7.text,
                                          Medicament8: _Medicament8.text,
                                          Medicament9: _Medicament9.text,
                                          Medicament10: _Medicament10.text,
                                          Medicament11: _Medicament11.text,
                                          Medicament12: _Medicament12.text,
                                          Dispo1: _Dispo1.text,
                                          Dispo2: _Dispo2.text,
                                          Dispo3: _Dispo3.text,
                                          Dispo4: _Dispo4.text,
                                          Dispo5: _Dispo5.text,
                                          Dispo6: _Dispo6.text,
                                          Dispo7: _Dispo7.text,
                                          Dispo8: _Dispo8.text,
                                          Dispo9: _Dispo9.text,
                                          Dispo10: _Dispo10.text,
                                          Dispo11: _Dispo11.text,
                                          Dispo12: _Dispo12.text,
                                          Rotation1: _Rotation1.text,
                                          Rotation2: _Rotation2.text,
                                          Rotation3: _Rotation3.text,
                                          Rotation4: _Rotation4.text,
                                          Rotation5: _Rotation5.text,
                                          Rotation6: _Rotation6.text,
                                          Rotation7: _Rotation7.text,
                                          Rotation8: _Rotation8.text,
                                          Rotation9: _Rotation9.text,
                                          Rotation10: _Rotation10.text,
                                          Rotation11: _Rotation11.text,
                                          Rotation12: _Rotation12.text,
                                          Commande1: _Commande1.text,
                                          Commande2: _Commande2.text,
                                          Commande3: _Commande3.text,
                                          Commande4: _Commande4.text,
                                          Commande5: _Commande5.text,
                                          Commande6: _Commande6.text,
                                          Commande7: _Commande7.text,
                                          Commande8: _Commande8.text,
                                          Commande9: _Commande9.text,
                                          Commande10: _Commande10.text,
                                          Commande11: _Commande11.text,
                                          Commande12: _Commande12.text,
                                          ));

                                      Navigator.pop(context);
                                    }
                                  } else {
                                    setState(() {
                                      selectedmap2 = true;
                                    });
                                  }
                                },
                                child: Text('Save',
                                    style: TextStyle(color: Colors.white)),
                                color: Colors.blue,
                              )
                            ],
                          ),
                        ),
                      ],
                    ))),
          ),
        ),
      ),
    );
  }
}

// class _EditVisiteState extends State<EditVisite> {
//   _EditVisiteState();

//   final ApiService api = ApiService();
//   final _addFormKey = GlobalKey<FormState>();
//   String id = '';
//   final _nameController = TextEditingController();
//   String gender = 'male';
//   Gender _gender = Gender.male;
//   final _ageController = TextEditingController();
//   final _addressController = TextEditingController();
//   final _cityController = TextEditingController();
//   final _countryController = TextEditingController();
//   String status = 'positive';
//   Status _status = Status.positive;

//   @override
//   void initState() {
//     id = widget.cases.id;
//     _nameController.text = widget.cases.name;
//     gender = widget.cases.gender;
//     if (widget.cases.gender == 'male') {
//       _gender = Gender.male;
//     } else {
//       _gender = Gender.female;
//     }
//     _ageController.text = widget.cases.age.toString();
//     _addressController.text = widget.cases.address;
//     _cityController.text = widget.cases.city;
//     _countryController.text = widget.cases.country;
//     status = widget.cases.status;
//     if (widget.cases.status == 'positive') {
//       _status = Status.positive;
//     } else if (widget.cases.status == 'dead') {
//       _status = Status.dead;
//     } else {
//       _status = Status.recovered;
//     }
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Edit Cases'),
//       ),
//       body: Form(
//         key: _addFormKey,
//         child: SingleChildScrollView(
//           child: Container(
//             padding: EdgeInsets.all(20.0),
//             child: Card(
//                 child: Container(
//                     padding: EdgeInsets.all(10.0),
//                     width: 440,
//                     child: Column(
//                       children: <Widget>[
//                         Container(
//                           margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
//                           child: Column(
//                             children: <Widget>[
//                               Text('Full Name'),
//                               TextFormField(
//                                 controller: _nameController,
//                                 decoration: const InputDecoration(
//                                   hintText: 'Full Name',
//                                 ),
//                                 validator: (value) {
//                                   if (value.isEmpty) {
//                                     return 'Please enter full name';
//                                   }
//                                   return null;
//                                 },
//                                 onChanged: (value) {},
//                               ),
//                             ],
//                           ),
//                         ),
//                         Container(
//                           margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
//                           child: Column(
//                             children: <Widget>[
//                               Text('Gender'),
//                               ListTile(
//                                 title: const Text('Male'),
//                                 leading: Radio(
//                                   value: Gender.male,
//                                   groupValue: _gender,
//                                   onChanged: (Gender value) {
//                                     setState(() {
//                                       _gender = value;
//                                       gender = 'male';
//                                     });
//                                   },
//                                 ),
//                               ),
//                               ListTile(
//                                 title: const Text('Female'),
//                                 leading: Radio(
//                                   value: Gender.female,
//                                   groupValue: _gender,
//                                   onChanged: (Gender value) {
//                                     setState(() {
//                                       _gender = value;
//                                       gender = 'female';
//                                     });
//                                   },
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Container(
//                           margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
//                           child: Column(
//                             children: <Widget>[
//                               Text('Age'),
//                               TextFormField(
//                                 controller: _ageController,
//                                 decoration: const InputDecoration(
//                                   hintText: 'Age',
//                                 ),
//                                 keyboardType: TextInputType.number,
//                                 validator: (value) {
//                                   if (value.isEmpty) {
//                                     return 'Please enter age';
//                                   }
//                                   return null;
//                                 },
//                                 onChanged: (value) {},
//                               ),
//                             ],
//                           ),
//                         ),
//                         Container(
//                           margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
//                           child: Column(
//                             children: <Widget>[
//                               Text('Address'),
//                               TextFormField(
//                                 controller: _addressController,
//                                 decoration: const InputDecoration(
//                                   hintText: 'Address',
//                                 ),
//                                 validator: (value) {
//                                   if (value.isEmpty) {
//                                     return 'Please enter address';
//                                   }
//                                   return null;
//                                 },
//                                 onChanged: (value) {},
//                               ),
//                             ],
//                           ),
//                         ),
//                         Container(
//                           margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
//                           child: Column(
//                             children: <Widget>[
//                               Text('City'),
//                               TextFormField(
//                                 controller: _cityController,
//                                 decoration: const InputDecoration(
//                                   hintText: 'City',
//                                 ),
//                                 validator: (value) {
//                                   if (value.isEmpty) {
//                                     return 'Please enter city';
//                                   }
//                                   return null;
//                                 },
//                                 onChanged: (value) {},
//                               ),
//                             ],
//                           ),
//                         ),
//                         Container(
//                           margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
//                           child: Column(
//                             children: <Widget>[
//                               Text('Country'),
//                               TextFormField(
//                                 controller: _countryController,
//                                 decoration: const InputDecoration(
//                                   hintText: 'Country',
//                                 ),
//                                 validator: (value) {
//                                   if (value.isEmpty) {
//                                     return 'Please enter country';
//                                   }
//                                   return null;
//                                 },
//                                 onChanged: (value) {},
//                               ),
//                             ],
//                           ),
//                         ),
//                         Container(
//                           margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
//                           child: Column(
//                             children: <Widget>[
//                               Text('Status'),
//                               ListTile(
//                                 title: const Text('Positive'),
//                                 leading: Radio(
//                                   value: Status.positive,
//                                   groupValue: _status,
//                                   onChanged: (Status value) {
//                                     setState(() {
//                                       _status = value;
//                                       status = 'positive';
//                                     });
//                                   },
//                                 ),
//                               ),
//                               ListTile(
//                                 title: const Text('Dead'),
//                                 leading: Radio(
//                                   value: Status.dead,
//                                   groupValue: _status,
//                                   onChanged: (Status value) {
//                                     setState(() {
//                                       _status = value;
//                                       status = 'dead';
//                                     });
//                                   },
//                                 ),
//                               ),
//                               ListTile(
//                                 title: const Text('Recovered'),
//                                 leading: Radio(
//                                   value: Status.recovered,
//                                   groupValue: _status,
//                                   onChanged: (Status value) {
//                                     setState(() {
//                                       _status = value;
//                                       status = 'recovered';
//                                     });
//                                   },
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Container(
//                           margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
//                           child: Column(
//                             children: <Widget>[
//                               RaisedButton(
//                                 splashColor: Colors.red,
//                                 onPressed: () {
//                                   if (_addFormKey.currentState.validate()) {
//                                     _addFormKey.currentState.save();
//                                     api.updateCases(Cases(
//                                         id: id,
//                                         name: _nameController.text,
//                                         gender: gender,
//                                         age: _ageController.text,
//                                         address: _addressController.text,
//                                         city: _cityController.text,
//                                         country: _countryController.text,
//                                         status: status));

//                                     Navigator.pop(context);
//                                   }
//                                 },
//                                 child: Text('Save',
//                                     style: TextStyle(color: Colors.white)),
//                                 color: Colors.blue,
//                               )
//                             ],
//                           ),
//                         ),
//                       ],
//                     ))),
//           ),
//         ),
//       ),
//     );
//   }
// }
