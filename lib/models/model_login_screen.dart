// class LoginScreenModel {
//   bool? success;
//   Data? data;
//   String? message;

//   LoginScreenModel({this.success, this.data, this.message});

//   LoginScreenModel.fromJson(Map<String, dynamic> json) {
//     success = json['success'];
//     data = json['data'] != null ? new Data.fromJson(json['data']) : null;
//     message = json['message'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['success'] = this.success;
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     data['message'] = this.message;
//     return data;
//   }
// }

// class Data {
//   User? user;
//   Token? token;
//   List<String>? role;

//   Data({this.user, this.token, this.role});

//   Data.fromJson(Map<String, dynamic> json) {
//     user = json["team"] != null ? new User.fromJson(json["team"]) : null;
//     token = json['token'] != null ? new Token.fromJson(json['token']) : null;
//     role = json['Role'].cast<String>();
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.user != null) {
//       data["team"] = this.user!.toJson();
//     }
//     if (this.token != null) {
//       data['token'] = this.token!.toJson();
//     }
//     data['Role'] = this.role;
//     return data;
//   }
// }

// class User {
//   int? id;
//   String? name;
//   Location? location;
//   String? dOB;
//   String? phone;
//   String? email;
//   String? createdAt;
//   String? updatedAt;
//   List<Roles>? roles;

//   User(
//       {this.id,
//       this.name,
//       this.location,
//       this.dOB,
//       this.phone,
//       this.email,
//       this.createdAt,
//       this.updatedAt,
//       this.roles});

//   User.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     location = json['location'] != null
//         new Location.fromJson(json['location'])
//         : null;
//     dOB = json['DOB'];
//     phone = json['phone'];
//     email = json['email'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     if (json['roles'] != null) {
//       roles = <Roles>[];
//       json['roles'].forEach((v) {
//         roles!.add(new Roles.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     if (this.location != null) {
//       data['location'] = this.location!.toJson();
//     }
//     data['DOB'] = this.dOB;
//     data['phone'] = this.phone;
//     data['email'] = this.email;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     if (this.roles != null) {
//       data['roles'] = this.roles!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Location {
//   String? lat;
//   String? long;

//   Location({this.lat, this.long});

//   Location.fromJson(Map<String, dynamic> json) {
//     lat = json['lat'];
//     long = json['long'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['lat'] = this.lat;
//     data['long'] = this.long;
//     return data;
//   }
// }

// class Roles {
//   int? id;
//   String? name;
//   String? guardName;
//   String? createdAt;
//   String? updatedAt;
//   Pivot? pivot;

//   Roles(
//       {this.id,
//       this.name,
//       this.guardName,
//       this.createdAt,
//       this.updatedAt,
//       this.pivot});

//   Roles.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     guardName = json['guard_name'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['guard_name'] = this.guardName;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     if (this.pivot != null) {
//       data['pivot'] = this.pivot!.toJson();
//     }
//     return data;
//   }
// }

// class Pivot {
//   int? modelId;
//   int? roleId;
//   String? modelType;

//   Pivot({this.modelId, this.roleId, this.modelType});

//   Pivot.fromJson(Map<String, dynamic> json) {
//     modelId = json['model_id'];
//     roleId = json['role_id'];
//     modelType = json['model_type'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['model_id'] = this.modelId;
//     data['role_id'] = this.roleId;
//     data['model_type'] = this.modelType;
//     return data;
//   }
// }

// class Token {
//   String? token;

//   Token({this.token});

//   Token.fromJson(Map<String, dynamic> json) {
//     token = json['token'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['token'] = this.token;
//     return data;
//   }
// }

class LoginScreenModel {
  bool? success;
  Data? data;
  String? message;

  LoginScreenModel({this.success, this.data, this.message});

  LoginScreenModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  Team? team;
  Token? token;
  List<String>? role;

  Data({this.team, this.token, this.role});

  Data.fromJson(Map<String, dynamic> json) {
    team = json['team'] != null ? new Team.fromJson(json['team']) : null;
    token = json['token'] != null ? new Token.fromJson(json['token']) : null;
    role = json['Role'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.team != null) {
      data['team'] = this.team!.toJson();
    }
    if (this.token != null) {
      data['token'] = this.token!.toJson();
    }
    data['Role'] = this.role;
    return data;
  }
}

class Team {
  int? id;
  String? name;
  Location? location;
  int? available;
  int? active;
  String? phone;
  String? email;
  int? rate;
  String? finishAt;
  String? createdAt;
  String? updatedAt;
  int? companyId;
  List<Roles>? roles;

  Team(
      {this.id,
      this.name,
      this.location,
      this.available,
      this.active,
      this.phone,
      this.email,
      this.rate,
      this.finishAt,
      this.createdAt,
      this.updatedAt,
      this.companyId,
      this.roles});

  Team.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    available = json['available'];
    active = json['active'];
    phone = json['phone'];
    email = json['email'];
    rate = json['rate'];
    finishAt = json['FinishAt'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    companyId = json['company_id'];
    if (json['roles'] != null) {
      roles = <Roles>[];
      json['roles'].forEach((v) {
        roles!.add(new Roles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['available'] = this.available;
    data['active'] = this.active;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['rate'] = this.rate;
    data['FinishAt'] = this.finishAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['company_id'] = this.companyId;
    if (this.roles != null) {
      data['roles'] = this.roles!.map((v) => v.toJson()).toList();
    }
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

class Roles {
  int? id;
  String? name;
  String? guardName;
  String? createdAt;
  String? updatedAt;
  Pivot? pivot;

  Roles(
      {this.id,
      this.name,
      this.guardName,
      this.createdAt,
      this.updatedAt,
      this.pivot});

  Roles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    guardName = json['guard_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['guard_name'] = this.guardName;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    return data;
  }
}

class Pivot {
  int? modelId;
  int? roleId;
  String? modelType;

  Pivot({this.modelId, this.roleId, this.modelType});

  Pivot.fromJson(Map<String, dynamic> json) {
    modelId = json['model_id'];
    roleId = json['role_id'];
    modelType = json['model_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['model_id'] = this.modelId;
    data['role_id'] = this.roleId;
    data['model_type'] = this.modelType;
    return data;
  }
}

class Token {
  String? token;

  Token({this.token});

  Token.fromJson(Map<String, dynamic> json) {
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    return data;
  }
}
