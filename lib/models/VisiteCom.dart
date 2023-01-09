class VisiteCom {
  final String id;
  final String NomPharmacie;
  final String NomPharmacieid;
  final String NomContact;
  final String Rapport;
  final String V1;
  final String V2;
  final String V3;
  final String V4;
  final String V5;
  final String V6;
  final String V7;
  final String V8;
  final String V9;
  final String Lng;
  final String Lat;
  final String date;
  final String Medicament1;
  final String Medicament2;
  final String Medicament3;
  final String Medicament4;
  final String Medicament5;
  final String Medicament6;
  final String Medicament7;
  final String Medicament8;
  final String Medicament9;
  final String Medicament10;
  final String Medicament11;
  final String Medicament12;
  final String Dispo1;
  final String Dispo2;
  final String Dispo3;
  final String Dispo4;
  final String Dispo5;
  final String Dispo6;
  final String Dispo7;
  final String Dispo8;
  final String Dispo9;
  final String Dispo10;
  final String Dispo11;
  final String Dispo12;
  final String Rotation1;
  final String Rotation2;
  final String Rotation3;
  final String Rotation4;
  final String Rotation5;
  final String Rotation6;
  final String Rotation7;
  final String Rotation8;
  final String Rotation9;
  final String Rotation10;
  final String Rotation11;
  final String Rotation12;
  final String Commande1;
  final String Commande2;
  final String Commande3;
  final String Commande4;
  final String Commande5;
  final String Commande6;
  final String Commande7;
  final String Commande8;
  final String Commande9;
  final String Commande10;
  final String Commande11;
  final String Commande12;

  VisiteCom(
      {
        this.NomContact,
        this.NomPharmacie,
        this.NomPharmacieid,
        this.Rapport,
        this.V1,
        this.V2,
        this.V3,
        this.V4,
        this.V5,
        this.V6,
        this.V7,
        this.V8,
        this.V9,
        this.id,
        this.Lat,
        this.Lng,
        this.date,
        this.Medicament1,
        this.Medicament2,
        this.Medicament3,
        this.Medicament4,
        this.Medicament5,
        this.Medicament6,
        this.Medicament7,
        this.Medicament8,
        this.Medicament9,
        this.Medicament10,
        this.Medicament11,
        this.Medicament12,
        this.Dispo1,
        this.Dispo2,
        this.Dispo3,
        this.Dispo4,
        this.Dispo5,
        this.Dispo6,
        this.Dispo7,
        this.Dispo8,
        this.Dispo9,
        this.Dispo10,
        this.Dispo11,
        this.Dispo12,
        this.Rotation1,
        this.Rotation2,
        this.Rotation3,
        this.Rotation4,
        this.Rotation5,
        this.Rotation6,
        this.Rotation7,
        this.Rotation8,
        this.Rotation9,
        this.Rotation10,
        this.Rotation11,
        this.Rotation12,
        this.Commande1,
        this.Commande2,
        this.Commande3,
        this.Commande4,
        this.Commande5,
        this.Commande6,
        this.Commande7,
        this.Commande8,
        this.Commande9,
        this.Commande10,
        this.Commande11,
        this.Commande12,});

  factory VisiteCom.fromJson(Map<String, dynamic> json) {
    return VisiteCom(
        id: json['_id'] as String,
        V1: json['V1'] as String,
        V2: json['V2'] as String,
        V3: json['V3'] as String,
        V4: json['V4'] as String,
        V5: json['V5'] as String,
        V6: json['V6'] as String,
        V7: json['V7'] as String,
        V8: json['V8'] as String,
        V9: json['V9'] as String,
        Lat: json['Lat'] as String,
        Lng: json['Lng'] as String,
        NomContact: json['NomContact'] as String,
        NomPharmacie: json['NomPharmacie'] as String,
        NomPharmacieid: json['NomPharmacieid'] as String,
        Rapport: json['Rapport'] as String,
        date: json['date'] as String,
        Medicament1: json['Medicament1'] as String,
        Medicament2: json['Medicament2'] as String,
        Medicament3: json['Medicament3'] as String,
        Medicament4: json['Medicament4'] as String,
        Medicament5: json['Medicament5'] as String,
        Medicament6: json['Medicament6'] as String,
        Medicament7: json['Medicament7'] as String,
        Medicament8: json['Medicament8'] as String,
        Medicament9: json['Medicament9'] as String,
        Medicament10: json['Medicament10'] as String,
        Medicament11: json['Medicament11'] as String,
        Medicament12: json['Medicament12'] as String,
        Dispo1: json['Dispo1'] as String,
        Dispo2: json['Dispo2'] as String,
        Dispo3: json['Dispo3'] as String,
        Dispo4: json['Dispo4'] as String,
        Dispo5: json['Dispo5'] as String,
        Dispo6: json['Dispo6'] as String,
        Dispo7: json['Dispo7'] as String,
        Dispo8: json['Dispo8'] as String,
        Dispo9: json['Dispo9'] as String,
        Dispo10: json['Dispo10'] as String,
        Dispo11: json['Dispo11'] as String,
        Dispo12: json['Dispo12'] as String,
        Rotation1: json['Rotation1'] as String,
        Rotation2: json['Rotation2'] as String,
        Rotation3: json['Rotation3'] as String,
        Rotation4: json['Rotation4'] as String,
        Rotation5: json['Rotation5'] as String,
        Rotation6: json['Rotation6'] as String,
        Rotation7: json['Rotation7'] as String,
        Rotation8: json['Rotation8'] as String,
        Rotation9: json['Rotation9'] as String,
        Rotation10: json['Rotation10'] as String,
        Rotation11: json['Rotation11'] as String,
        Rotation12: json['Rotation12'] as String,
        Commande1: json['Commande1'] as String,
        Commande2: json['Commande2'] as String,
        Commande3: json['Commande3'] as String,
        Commande4: json['Commande4'] as String,
        Commande5: json['Commande5'] as String,
        Commande6: json['Commande6'] as String,
        Commande7: json['Commande7'] as String,
        Commande8: json['Commande8'] as String,
        Commande9: json['Commande9'] as String,
        Commande10: json['Commande10'] as String,
        Commande11: json['Commande11'] as String,
        Commande12: json['Dispo12'] as String
    );
  }

  @override
  String toString() {
    return 'Trans{id: $id,NomPharmacie: $NomPharmacie,NomPharmacieid: $NomPharmacieid, Rapport: $Rapport,'
        'V1: $V1,V2: $V2,V3: $V3,V4: $V4,V5: $V5,V6: $V6,V7: $V7,V8: $V8, V9:$V9,Lng:$Lng,Lat:$Lat,date:$date,'
        'Medicament1:$Medicament1,Medicament2:$Medicament2,Medicament3:$Medicament3,Medicament4:$Medicament4,Medicament5:$Medicament5,'
        'Medicament6:$Medicament6,Medicament7:$Medicament7,Medicament8:$Medicament8,Medicament9:$Medicament9,Medicament10:$Medicament10,'
        'Medicament11:$Medicament11,Medicament12:$Medicament12,Dispo1:$Dispo1,Dispo2:$Dispo2,Dispo3:$Dispo3,Dispo4:$Dispo4,Dispo5:$Dispo5,'
        'Dispo6:$Dispo6,Dispo7:$Dispo7,Dispo8:$Dispo8,Dispo9:$Dispo9,Dispo10:$Dispo10,Dispo11:$Dispo11,Dispo12:$Dispo12,'
        'Rotation1:$Rotation1,Rotation2:$Rotation2,Rotation3:$Rotation3,Rotation4:$Rotation4,Rotation5:$Rotation5,'
        'Rotation6:$Rotation6,Rotation7:$Rotation7,Rotation8:$Rotation8,Rotation9:$Rotation9,Rotation10:$Rotation10,'
        'Rotation11:$Rotation11,Rotation12:$Rotation12,Commande1:$Commande1,Commande2:$Commande2,Commande3:$Commande3,'
        'Commande4:$Commande4,Commande5:$Commande5,Commande6:$Commande6,Commande7:$Commande7,Commande8:$Commande8,'
        'Commande9:$Commande9,Commande10:$Commande10,Commande11:$Commande11,Commande12:$Commande12,}';
  }
}
