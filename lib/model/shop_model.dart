import 'package:cloud_firestore/cloud_firestore.dart';

class ShopModel {
  //الخصائص اللي هتظهر لكل محل
  String? name;
  String? number;
  String? date;
  String? image;
  String? location;
  String? delivery;

  ShopModel({this.name, this.location, this.number, this.image, this.date});

  ShopModel.fromJson(Map<dynamic, dynamic> map) {
    name = map['shopName'];
    number = map['shopNumber'];
    image = map['image'];
    date = map['date'];
    location = map['location'];
    delivery = map['delivery'];

    return;
  }
  toJson() {
    return {
      'shopName': name,
      'image': image,
      'shopNumber': number,
      'date': date,
      'location': location,
      'delivery': delivery,
    };
  }

  // creating a Trip object from a firebase snapshot
  ShopModel.fromSnapshot(DocumentSnapshot snapshot)
      : name = snapshot['name'],
        number = snapshot['number'];
  // date = snapshot['date'];
  // image  = snapshot['image'];
  // location =snapshot['location'];
  // delivery=snapshot['delivery'];

}
