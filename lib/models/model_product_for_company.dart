class ProductForCompanyModel {
  bool? success;
  List<DataProducts>? data;
  String? message;

  ProductForCompanyModel({this.success, this.data, this.message});

  ProductForCompanyModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <DataProducts>[];
      json['data'].forEach((v) {
        data!.add(DataProducts.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}

class DataProducts {
  int? id;
  String? name;
  late List<CompanyProducts> products;

  DataProducts({this.id, this.name, required this.products});

  DataProducts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['products'] != null) {
      products = <CompanyProducts>[];
      json['products'].forEach((v) {
        products.add(CompanyProducts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    if (products != null) {
      data['products'] = products.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CompanyProducts {
  int? id;
  late String name;
  late String image;
  late String price;
  int quantity = 1;
  int? available;
  Categore? categore;
  List<CompanyFeatures>? features;

  CompanyProducts(
      {this.id,
      required this.name,
      required this.image,
      required this.price,
      required this.quantity,
      this.available,
      this.categore,
      this.features});

  CompanyProducts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    price = json['price'];
    available = json['available'];
    categore =
        json['categore'] != null ? Categore.fromJson(json['categore']) : null;
    if (json['features'] != null) {
      features = <CompanyFeatures>[];
      json['features'].forEach((v) {
        features!.add(CompanyFeatures.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['price'] = price;
    data['available'] = available;
    if (categore != null) {
      data['categore'] = categore!.toJson();
    }
    if (features != null) {
      data['features'] = features!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categore {
  int? id;
  String? name;

  Categore({this.id, this.name});

  Categore.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class CompanyFeatures {
  int? id;
  String? name;
  String? type;
  String? suffix;
  String? value;

  CompanyFeatures({this.id, this.name, this.type, this.suffix, this.value});

  CompanyFeatures.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    suffix = json['suffix'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['type'] = type;
    data['suffix'] = suffix;
    data['value'] = value;
    return data;
  }
}
