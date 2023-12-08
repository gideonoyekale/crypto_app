class Coin {
  String? name;
  String? code;
  double? price;
  double? sign;

  Coin({this.name, this.code, this.price, this.sign});

  Coin.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    code = json['code'];
    price = json['price'];
    sign = json['sign'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['code'] = code;
    data['price'] = price;
    data['sign'] = sign;
    return data;
  }
}
