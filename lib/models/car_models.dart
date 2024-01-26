class Cars {
  String? id;
  String? name;
  String? brand;
  double? price;
  String? type;
  String? imageUrl;
  bool? isFavorite;
  Cars({
    this.id,
    this.name,
    this.brand,
    this.price,
    this.type,
    this.imageUrl,
    this.isFavorite,
  });
  Cars.fromJson(Map<String, dynamic> json) {
    id = json['carsId'];
    name = json['carsName'];
    brand = json['carsBrand'];
    price = double.parse(json['price']);
    type = json['carsType'];
    imageUrl = json['carsImageUrl'];
  }
}
