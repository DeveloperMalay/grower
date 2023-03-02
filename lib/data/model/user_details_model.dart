class UserDetails {
  int? status;
  String? message;
  late Data data;

  UserDetails({this.status, this.message, required this.data});

  UserDetails.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;

    data['data'] = this.data.toJson();

    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? email;
  String? address;
  String? number;
  int? profileSetup;
  String? hitRemaining;
  String? otp;
  String? freeHit;

  Data(
      {this.id,
      this.name,
      this.email,
      this.address,
      this.number,
      this.profileSetup,
      this.hitRemaining,
      this.otp,
      this.freeHit});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] == null ? '' : json['name'];
    email = json['email'];
    address = json['address'] == null ? '' : json['address'];
    number = json['number'] == null ? '' : json['number'];
    profileSetup = json['profile_setup'];
    hitRemaining = json['hit_remaining'];
    otp = json['otp'];
    freeHit = json['free_hit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['address'] = this.address;
    data['number'] = this.number;
    data['profile_setup'] = this.profileSetup;
    data['hit_remaining'] = this.hitRemaining;
    data['otp'] = this.otp;
    data['free_hit'] = this.freeHit;
    return data;
  }
}
