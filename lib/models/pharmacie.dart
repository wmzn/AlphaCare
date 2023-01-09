class Pharmacies {
  final String id;
  final String NomPharmacie;
  final String Type;
  final String NomVcom;
  final String NomContact;
  final String Phone;
  final String Wilaya;
  final String Commun;
  final String Daira;
  final String CodeP;
  final String Route;
  final String name;
  final String gender;
  final String age;
  final String address;
  final String city;
  final String country;
  final String status;
  final String updated;
  final String Lat;
  final String Lng;
  final String email;
  final String potentielProduit;

  Pharmacies(
      {
        this.email,
        this.NomPharmacie,
        this.Type,
        this.NomVcom,
        this.NomContact,
        this.Phone,
        this.Wilaya,
        this.Commun,
        this.Daira,
        this.CodeP,
        this.Route,
        this.potentielProduit,
        this.id,
        this.name,
        this.gender,
        this.age,
        this.address,
        this.city,
        this.country,
        this.status,
        this.updated,
        this.Lat,
        this.Lng});

  factory Pharmacies.fromJson(Map<String, dynamic> json) {
    return Pharmacies(
      id: json['_id'] as String,
      gender: json['gender'] as String,
      name: json['name'] as String,
      age: json['age'] as String,
      address: json['address'] as String,
      city: json['city'] as String,
      country: json['country'] as String,
      status: json['status'] as String,
      updated: json['updated'] as String,
      Lat: json['Lat'] as String,
      Lng: json['Lng'] as String,
      NomPharmacie: json['NomPharmacie'] as String,
      Type: json['Type'] as String,
      NomVcom: json['NomVcom'] as String,
      NomContact: json['NomContact'] as String,
      Phone: json['Phone'] as String,
      Wilaya: json['Wilaya'] as String,
      Commun: json['Commun'] as String,
      Daira: json['Daira'] as String,
      CodeP: json['CodeP'] as String,
      Route: json['Route'] as String,
      email: json['email'] as String,
      potentielProduit: json['potentielProduit'] as String,
    );
  }

  @override
  String toString() {
    return 'Trans{id: $id, NomPharmacie: $NomPharmacie, Type: $Type, NomVcom: $NomVcom, age: $age,gender: $gender, name:$name ,address: $address,age: $age,city: $city,country: $country,status: $status,Lat: $Lat,Lng: $Lng, NomContact:$NomContact,Phone:$Phone, Wilaya:$Wilaya,Commun:$Commun,Daira:$Daira,CodeP:$CodeP,Route:$Route,email:$email,potentielProduit:$potentielProduit }';
  }
}
