class UserModel {
  String? userName;
  String? email;
  String? passWord;
  String? location;
  String? uid;
  bool? isAdmin;
  List<String>? cartItems;
  List<String>? orderdItems;

  UserModel({
    this.userName,
    this.email,
    this.passWord,
    this.location,
    this.uid,
    this.isAdmin,
    this.cartItems,
    this.orderdItems,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    email = json['email'];
    passWord = json['passWord'];
    location = json['location'];
    uid = json['uid'];
    isAdmin = json['isAdmin'];
    cartItems = json['cartItems'];
    orderdItems = json['orderdItems'];
  }

  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'email': email,
      'passWord': passWord,
      'location': location,
      'uid': uid,
      'isAdmin': isAdmin,
      'cartItems': cartItems,
      'orderedItems': orderdItems,
    };
  }
}
