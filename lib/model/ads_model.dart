//ده اللي في الصفحه الرئيسيه اللي تحت السيرش
class AdsModel {
  String? image;

  AdsModel({this.image});

  AdsModel.fromJson(Map<dynamic, dynamic> map) {
    image = map['image'];

    return;
  }
  toJson() {
    return {
      'image': image,
    };
  }
}
