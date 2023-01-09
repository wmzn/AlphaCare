
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:direct_select/direct_select.dart';
import 'package:argon_flutter/services/api_service.dart';
import 'package:argon_flutter/services/Pharmacie_service.dart';
import 'package:argon_flutter/models/pharmacie.dart';
import 'package:argon_flutter/widgets/input.dart';
import 'package:argon_flutter/widgets/inputNumber.dart';
import 'package:argon_flutter/widgets/navbar.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/card/gf_card.dart';
import 'package:getwidget/components/dropdown/gf_dropdown.dart';
import 'package:getwidget/components/radio/gf_radio.dart';
import 'package:getwidget/size/gf_size.dart';
import 'package:getwidget/types/gf_radio_type.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:argon_flutter/constants/Theme.dart';
import 'package:argon_flutter/widgets/drawer.dart';
import 'package:location/location.dart';
import 'package:geocoder/geocoder.dart';
import 'package:search_choices/search_choices.dart';

enum Gender { male, female }
enum Status { positive, dead, recovered }

class AddPharma extends StatefulWidget {
  AddPharma();

  @override
  _AddPharmaState createState() => _AddPharmaState();
}
class MySelectionItem extends StatelessWidget {
  final String title;
  final bool isForList;

  const MySelectionItem({Key key, this.title, this.isForList = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.0,
      child: isForList
          ? Padding(
        child: _buildItem2(context),
        padding: EdgeInsets.all(10.0),
      )
          : Card(
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        color: Colors.transparent,
        shadowColor: Colors.transparent,
        child: Stack(
          children: <Widget>[
            _buildItem(context),
            Align(
              alignment: Alignment.centerRight,
              child: Icon(Icons.arrow_drop_down),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItem(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      decoration: myBoxDecoration(), //       <--- BoxDecoration here
      child: FittedBox(
        child: Text(
          title,
        ),
      ),
    );
  }

  Widget _buildItem2(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.topCenter,
      decoration: myBoxDecoration2(), //       <--- BoxDecoration here

      child: FittedBox(
        child: Text(
          title,
        ),
      ),
    );
  }
}

class _AddPharmaState extends State<AddPharma> {
  LatLng _initialcameraposition = LatLng(20.5937, 78.9629);
  GoogleMapController _controller;
  Location _location = Location();
  int groupValue = 0;
  int groupValuePotentielPatient = 0;
  int groupValuePotentielProduit = 0;

  var _NomPharmacie = TextEditingController();
  var _NomVcom = TextEditingController();
  var _NomContact = TextEditingController();
  var _Phone = TextEditingController();
  var _Secteur = TextEditingController();
  var _NomPhar = TextEditingController();
  var _PrenomPhar = TextEditingController();
  var _email = TextEditingController();

  void _onMapCreated(GoogleMapController _cntlr) {
    _controller = _cntlr;
    _location.onLocationChanged.listen((l) {
      _controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(l.latitude, l.longitude), zoom: 15),
        ),
      );
    });
  }

  void activateLocation() {
    _location.onLocationChanged.listen((l) {});
  }

  final Set<Marker> _markers = {};
  var _selectedPlace;
  var _selectedPlace2;
  var _selectedPlace3;

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
  _AddPharmaState();
  final PharmacieService api = PharmacieService();
  final _addFormKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  String gender = 'male';

  static String selectedValueSingleDialog;
  static String selectedValueSingleDialog2;
  static String selectedValueSingleDialog3;
  static String selectedValueSingleDialogOptions2;

  Gender _gender = Gender.male;
  final _ageController = TextEditingController();
  final _addressController = TextEditingController();
  final _cityController = TextEditingController();
  final _countryController = TextEditingController();
  Key Header1;

  String _mapController = 'false';
  bool selectedmap = false;
  bool selectedmap2 = false;

  String _Wilaya = '';
  String _Daira = '';
  String _Route = '';
  String _Pcode = '';
  final List<DropdownMenuItem> items = [];
  final List<DropdownMenuItem> typesItems = [];

  var kInitialPosition = LatLng(-33.8567844, 151.213108);

  String _Commune = '';



  String status = 'positive';
  Status _status = Status.positive;

  final elements1 = [
    'Pharmacie',
    'Parapharmacie',
    'Grossiste',
    'Super-grossiste',
  ];

  int selectedIndex1 = 0;

  List<Widget> _buildItems1() {
    return elements1
        .map((val) => MySelectionItem(
      title: val,
    ))
        .toList();
  }



  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(
          title: "Ajouter Point de Vente",
          rightOptions: false,
          backButton: true,
          transparent: false,
          bgColor: ArgonColors.success),
      backgroundColor: ArgonColors.bgColorScreen,
      drawer: ArgonDrawer(currentPage: "Pharmacie"),
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
                                child: Input(
                                  controller: _NomPharmacie,
                                  placeholder: "Nom de Point de Vente",
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
                                child: Text("Email",
                                    style: TextStyle(
                                        color: ArgonColors.text,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 12.0),
                                child: Input(
                                  controller: _email,
                                  placeholder: "Email",
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
                                child: Text("Téléphone",
                                    style: TextStyle(
                                        color: ArgonColors.text,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 12.0),
                                child: InputN(
                                  controller: _Phone,
                                  placeholder: "Téléphone",
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text("Type",
                                    style: TextStyle(
                                        color: ArgonColors.text,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16)),
                              ),
                          Padding(
                              padding: const EdgeInsets.only(left: 18, right: 18),
                              child: DirectSelect(
                                  itemExtent: 33.0,
                                  selectedIndex: selectedIndex1,
                                  child: MySelectionItem(
                                    isForList: false,
                                    title: elements1[selectedIndex1],
                                  ),
                                  onSelectedItemChanged: (index) {
                                    setState(() {
                                      print(index);
                                      selectedIndex1 = index;
                                    });
                                    Navigator.of(context).pop();
                                  },
                                  mode: DirectSelectMode.tap,
                                  items: _buildItems1(),)
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
                                child: Text("Potentiel Produit",
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
                                        Text("A",
                                            style: TextStyle(
                                                color: ArgonColors.text,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12)),
                                        GFRadio(
                                          type: GFRadioType.square,
                                          size: GFSize.LARGE,
                                          value: 1,
                                          groupValue: groupValuePotentielProduit,
                                          onChanged: (value) {
                                            setState(() {
                                              groupValuePotentielProduit = value;
                                            });
                                          },
                                          inactiveIcon: null,
                                          activeBorderColor: GFColors.SUCCESS,
                                          radioColor: GFColors.SUCCESS,
                                        ),
                                        Text("B",
                                            style: TextStyle(
                                                color: ArgonColors.text,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12)),
                                        GFRadio(
                                          type: GFRadioType.square,
                                          size: GFSize.LARGE,
                                          value: 2,
                                          groupValue: groupValuePotentielProduit,
                                          onChanged: (value) {
                                            setState(() {
                                              groupValuePotentielProduit = value;
                                            });
                                          },
                                          inactiveIcon: null,
                                          activeBorderColor: GFColors.SUCCESS,
                                          radioColor: GFColors.SUCCESS,
                                        ),
                                        Text("C",
                                            style: TextStyle(
                                                color: ArgonColors.text,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12)),
                                        GFRadio(
                                          type: GFRadioType.square,
                                          size: GFSize.LARGE,
                                          value: 3,
                                          groupValue: groupValuePotentielProduit,
                                          onChanged: (value) {
                                            setState(() {
                                              groupValuePotentielProduit = value;
                                            });
                                          },
                                          inactiveIcon: null,
                                          activeBorderColor: GFColors.SUCCESS,
                                          radioColor: GFColors.SUCCESS,
                                        ),
                                      ],
                                    )),
                              ),
                            ],
                          ),
                        ),
                        // Container(
                        //   margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        //   child: Column(
                        //     children: <Widget>[
                        //       Align(
                        //         alignment: Alignment.centerLeft,
                        //         child: Text("Nom Vm",
                        //             style: TextStyle(
                        //                 color: ArgonColors.text,
                        //                 fontWeight: FontWeight.w600,
                        //                 fontSize: 16)),
                        //       ),
                        //       Padding(
                        //         padding: const EdgeInsets.only(top: 12.0),
                        //         child: Input(
                        //           controller: _NomVm,
                        //           placeholder: "Nom Vm",
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        // Container(
                        //   margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        //   child: Column(
                        //     children: <Widget>[
                        //       Align(
                        //         alignment: Alignment.centerLeft,
                        //         child: Text("Nom Contact",
                        //             style: TextStyle(
                        //                 color: ArgonColors.text,
                        //                 fontWeight: FontWeight.w600,
                        //                 fontSize: 16)),
                        //       ),
                        //       Padding(
                        //         padding: const EdgeInsets.only(top: 12.0),
                        //         child: Input(
                        //           controller: _NomContact,
                        //           placeholder: "Nom Contact",
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),

                        Padding(
                          padding: EdgeInsets.only(top: 50.0),
                          child: Container(
                              height: MediaQuery.of(context).size.height / 1.5,
                              child: Column(children: <Widget>[
                                Container(
                                  height:
                                  MediaQuery.of(context).size.height / 1.5 -
                                      25,
                                  child: GoogleMap(
                                    gestureRecognizers: Set()
                                      ..add(
                                          Factory<OneSequenceGestureRecognizer>(
                                                  () => EagerGestureRecognizer())),
                                    initialCameraPosition: CameraPosition(
                                        target: _initialcameraposition),
                                    mapType: MapType.normal,
                                    onMapCreated: _onMapCreated,
                                    myLocationEnabled: true,
                                    onTap: (latlang) async {
                                      print("done");
                                      print(latlang.latitude);
                                      print(latlang.longitude);
                                      _selectedPlace2 = latlang.latitude;
                                      _selectedPlace3 = latlang.longitude;
                                      if (_markers.length >= 1) {
                                        _markers.clear();
                                      }
                                      selectedmap = true;
                                      _onAddMarkerButtonPressed(latlang);

                                      final coordinates = new Coordinates(
                                          latlang.latitude, latlang.longitude);
                                      var selectedPlace1 = await Geocoder.local
                                          .findAddressesFromCoordinates(
                                          coordinates);
                                      var selectedPlace = selectedPlace1.first;
                                      print(
                                          selectedPlace.coordinates.longitude);
                                      setState(() {
                                        _selectedPlace = selectedPlace;

                                        _Daira = selectedPlace.locality;
                                        _Wilaya = selectedPlace.adminArea;
                                        _Commune = selectedPlace.subAdminArea;
                                        _Route = selectedPlace.addressLine;
                                        if (selectedPlace.postalCode != null) {
                                          _Pcode = selectedPlace.postalCode;
                                        } else {
                                          _Pcode = '';
                                        }
                                      });
                                    },
                                    markers: _markers,
                                  ),
                                ),
                                if (selectedmap2)
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text("selection sur la map",
                                        style: TextStyle(
                                            color: ArgonColors.error,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12)),
                                  ),
                              ])),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Wilaya : " + _Wilaya,
                                      style: TextStyle(
                                          fontSize: 19,
                                          color: ArgonColors.text)),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Commune :" + _Commune,
                                      style: TextStyle(
                                          fontSize: 19,
                                          color: ArgonColors.text)),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Daira :" + _Daira,
                                      style: TextStyle(
                                          fontSize: 19,
                                          color: ArgonColors.text)),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Code postal :" + _Pcode,
                                      style: TextStyle(
                                          fontSize: 19,
                                          color: ArgonColors.text)),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Route :" + _Route,
                                      style: TextStyle(
                                          fontSize: 19,
                                          color: ArgonColors.text)),
                                ),
                              )
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
                                      api.createPharmacie(Pharmacies(
                                        name: _nameController.text,
                                        NomPharmacie: _NomPharmacie.text,
                                        Type: selectedIndex1.toString(),
                                        gender: gender,
                                        age: _ageController.text,
                                        address: _addressController.text,
                                        potentielProduit: groupValuePotentielProduit
                                            .toString(),
                                        NomVcom: _NomVcom.text,
                                        city: _cityController.text,
                                        country: _countryController.text,
                                        status: status,
                                        Lng: _selectedPlace2.toString(),
                                        Lat: _selectedPlace3.toString(),
                                        email: _email.text,
                                        NomContact: _NomContact.text,
                                        Phone: _Phone.text,
                                        Wilaya: _Wilaya,
                                        Commun: _Commune,
                                        Daira: _Daira,
                                        CodeP: _Pcode,
                                        Route: _Route,
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

BoxDecoration myBoxDecoration() {
  return BoxDecoration(
    color: Colors.white.withOpacity(.3),
    border: Border.all(width: 2, color: Colors.transparent),
    borderRadius: BorderRadius.all(
      Radius.circular(30),
      //         <--- border radius here
    ),
  );
}

BoxDecoration myBoxDecoration2() {
  return BoxDecoration(
    color: Colors.transparent,
  );
}

