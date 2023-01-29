class OrderByIdModel {
  bool? success;
  Data? data;
  String? message;

  OrderByIdModel({this.success, this.data, this.message});

  OrderByIdModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    return data;
  }
}

class Data {
  int? id;
  String? totalVoltage;
  int? totalPrice;
  String? hoursOnCharge;
  String? hoursOnBettary;
  String? space;
  LocationData? location;
  User? user;
  List<Products>? products;
  List<Devices>? devices;
  Appointment? appointment;

  Data(
      {this.id,
      this.totalVoltage,
      this.totalPrice,
      this.hoursOnCharge,
      this.hoursOnBettary,
      this.space,
      this.location,
      this.user,
      this.products,
      this.devices,
      this.appointment});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    totalVoltage = json['total_voltage'];
    totalPrice = json['total_price'];
    hoursOnCharge = json['hours_on_charge'];
    hoursOnBettary = json['hours_on_bettary'];
    space = json['space'];
    location = json['location'] != null
        ? LocationData.fromJson(json['location'])
        : null;
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
    if (json['devices'] != null) {
      devices = <Devices>[];
      json['devices'].forEach((v) {
        devices!.add(Devices.fromJson(v));
      });
    }
    appointment = json['appointment'] != null
        ? Appointment.fromJson(json['appointment'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['total_voltage'] = totalVoltage;
    data['total_price'] = totalPrice;
    data['hours_on_charge'] = hoursOnCharge;
    data['hours_on_bettary'] = hoursOnBettary;
    data['space'] = space;
    if (location != null) {
      data['location'] = location!.toJson();
    }
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    if (devices != null) {
      data['devices'] = devices!.map((v) => v.toJson()).toList();
    }
    if (appointment != null) {
      data['appointment'] = appointment!.toJson();
    }
    return data;
  }
}

class LocationData {
  double? lat;
  double? long;
  String? area;

  LocationData({this.lat, this.long, this.area});

  LocationData.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    long = json['long'];
    area = json['area'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lat'] = lat;
    data['long'] = long;
    data['area'] = area;
    return data;
  }
}

class User {
  int? id;
  String? name;
  LocationUser? location;
  String? phone;
  String? email;

  User({this.id, this.name, this.location, this.phone, this.email});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    location = json['location'] != null
        ? LocationUser.fromJson(json['location'])
        : null;
    phone = json['phone'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (location != null) {
      data['location'] = location!.toJson();
    }
    data['phone'] = phone;
    data['email'] = email;
    return data;
  }
}

class LocationUser {
  String? lat;
  String? long;
  String? area;

  LocationUser({this.lat, this.long, this.area});

  LocationUser.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    long = json['long'];
    area = json['area'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lat'] = lat;
    data['long'] = long;
    data['area'] = area;
    return data;
  }
}

class Products {
  Product? product;
  int? id;
  late int productAmmount;

  Products({this.product, this.id, required this.productAmmount});

  Products.fromJson(Map<String, dynamic> json) {
    product =
        json['product'] != null ? Product.fromJson(json['product']) : null;
    id = json['id'];
    productAmmount = json['product_ammount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (product != null) {
      data['product'] = product!.toJson();
    }
    data['id'] = this.id;
    data['product_ammount'] = productAmmount;
    return data;
  }
}

class Product {
  int? id;
  String? name;
  String? image;
  String? price;
  int? available;
  bool showProducts = false;
  int quantity = 1;
  Categore? categore;
  List<Features>? features;

  Product(
      {this.id,
      this.name,
      this.image,
      this.price,
      this.available,
      required this.showProducts,
      required this.quantity,
      this.categore,
      this.features});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    price = json['price'];
    available = json['available'];
    categore =
        json['categore'] != null ? Categore.fromJson(json['categore']) : null;
    if (json['features'] != null) {
      features = <Features>[];
      json['features'].forEach((v) {
        features!.add(Features.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['price'] = price;
    data['available'] = available;
    if (categore != null) {
      data['categore'] = this.categore!.toJson();
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class Features {
  int? id;
  String? name;
  String? type;
  String? suffix;
  String? value;

  Features({this.id, this.name, this.type, this.suffix, this.value});

  Features.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    suffix = json['suffix'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['type'] = type;
    data['suffix'] = suffix;
    data['value'] = value;
    return data;
  }
}

class Devices {
  Device? device;
  int? id;
  int? deviceAmmount;

  Devices({this.device, this.id, this.deviceAmmount});

  Devices.fromJson(Map<String, dynamic> json) {
    device = json['device'] != null ? Device.fromJson(json['device']) : null;
    id = json['id'];
    deviceAmmount = json['device_ammount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (device != null) {
      data['device'] = device!.toJson();
    }
    data['id'] = id;
    data['device_ammount'] = deviceAmmount;
    return data;
  }
}

class Device {
  int? id;
  String? name;
  String? image;
  String? voltage;
  String? voltagePower;
  int? fazesNumber;

  Device(
      {this.id,
      this.name,
      this.image,
      this.voltage,
      this.voltagePower,
      this.fazesNumber});

  Device.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    voltage = json['voltage'];
    voltagePower = json['voltagePower'];
    fazesNumber = json['FazesNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['voltage'] = voltage;
    data['voltagePower'] = voltagePower;
    data['FazesNumber'] = fazesNumber;
    return data;
  }
}

class Appointment {
  int? id;
  String? type;
  String? status;
  String? startTime;
  String? finishTime;
  int? days;
  Compane? compane;
  Team? team;

  Appointment(
      {this.id,
      this.type,
      this.status,
      this.startTime,
      this.finishTime,
      this.days,
      this.compane,
      this.team});

  Appointment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    status = json['status'];
    startTime = json['startTime'];
    finishTime = json['finishTime'];
    days = json['days'];
    compane =
        json['compane'] != null ? Compane.fromJson(json['compane']) : null;
    team = json['team'] != null ? Team.fromJson(json['team']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['status'] = status;
    data['startTime'] = startTime;
    data['finishTime'] = finishTime;
    data['days'] = days;
    if (compane != null) {
      data['compane'] = compane!.toJson();
    }
    if (team != null) {
      data['team'] = team!.toJson();
    }
    return data;
  }
}

class Compane {
  int? id;
  String? name;
  int? rate;

  Compane({this.id, this.name, this.rate});

  Compane.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    rate = json['rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['rate'] = rate;
    return data;
  }
}

class Team {
  int? id;
  String? name;
  LocationTeam? location;
  int? available;
  int? active;
  String? email;
  String? phone;
  String? finishAt;

  Team(
      {this.id,
      this.name,
      this.location,
      this.available,
      this.active,
      this.email,
      this.phone,
      this.finishAt});

  Team.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    location = json['location'] != null
        ? LocationTeam.fromJson(json['location'])
        : null;
    available = json['available'];
    active = json['active'];
    email = json['email'];
    phone = json['phone'];
    finishAt = json['FinishAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (location != null) {
      data['location'] = location!.toJson();
    }
    data['available'] = available;
    data['active'] = active;
    data['email'] = email;
    data['phone'] = phone;
    data['FinishAt'] = finishAt;
    return data;
  }
}

class LocationTeam {
  String? lat;
  String? long;
  String? area;

  LocationTeam({this.lat, this.long, this.area});

  LocationTeam.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    long = json['long'];
    area = json['area'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lat'] = lat;
    data['long'] = long;
    data['area'] = area;
    return data;
  }
}
