class GetAppointmentTeamModel {
  bool? success;
  List<Data>? data;
  String? message;

  GetAppointmentTeamModel({this.success, this.data, this.message});

  GetAppointmentTeamModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  int? id;
  String? type;
  String? status;
  String? startTime;
  String? finishTime;
  int? days;
  bool? customerDetails = false;
  Compane? compane;
  Team? team;

  Data({
    this.id,
    this.type,
    this.status,
    this.startTime,
    this.finishTime,
    this.days,
    this.compane,
    this.team,
    this.customerDetails,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    status = json['status'];
    startTime = json['startTime'];
    finishTime = json['finishTime'];
    days = json['days'];
    compane =
        json['compane'] != null ? new Compane.fromJson(json['compane']) : null;
    team = json['team'] != null ? new Team.fromJson(json['team']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['status'] = this.status;
    data['startTime'] = this.startTime;
    data['finishTime'] = this.finishTime;
    data['days'] = this.days;
    if (this.compane != null) {
      data['compane'] = this.compane!.toJson();
    }
    if (this.team != null) {
      data['team'] = this.team!.toJson();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['rate'] = this.rate;
    return data;
  }
}

class Team {
  int? id;
  String? name;
  Location? location;
  int? available;
  String? email;
  String? phone;
  String? finishAt;

  Team(
      {this.id,
      this.name,
      this.location,
      this.available,
      this.email,
      this.phone,
      this.finishAt});

  Team.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    available = json['available'];
    email = json['email'];
    phone = json['phone'];
    finishAt = json['FinishAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['available'] = this.available;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['FinishAt'] = this.finishAt;
    return data;
  }
}

class Location {
  String? lat;
  String? long;
  String? area;

  Location({this.lat, this.long, this.area});

  Location.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    long = json['long'];
    area = json['area'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = this.lat;
    data['long'] = this.long;
    data['area'] = this.area;
    return data;
  }
}
