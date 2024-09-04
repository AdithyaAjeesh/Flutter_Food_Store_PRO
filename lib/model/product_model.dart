class ProductModel {
  String? name;
  String? discription;
  String? price;
  String? catagory;
  String? image;
  String? id;

  ProductModel({
    this.name,
    this.discription,
    this.price,
    this.catagory,
    this.image,
    this.id,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    discription = json['discription'];
    price = json['price'];
    catagory = json['catagory'];
    image = json['image'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'discription': discription,
      'price': price,
      'catagory': catagory,
      'image': image,
      'id': id,
    };
  }
}

class ToppingModel {
  String? name;
  String? price;
  String? count;
}
