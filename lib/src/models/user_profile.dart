class UserProfile {
  UserProfile({this.profile});

  final Profile profile;

  UserProfile.fromJson(Map<String, dynamic> json)
      : profile =
            json['profile'] != null ? Profile.fromJson(json['profile']) : null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.profile != null) {
      data['profile'] = this.profile.toJson();
    }
    return data;
  }
}

class Profile {
  String username;
  String name;
  int birthdate;
  int workDate;
  String work;
  String education;
  List<String> hobbies;
  List<String> songs;
  List<String> images;
  String bio;
  List<Moment> moment;

  Profile(
      {this.username,
      this.name,
      this.birthdate,
      this.workDate,
      this.work,
      this.education,
      this.hobbies,
      this.songs,
      this.images,
      this.bio,
      this.moment});

  Profile.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    name = json['name'];
    birthdate = json['birthdate'];
    workDate = json['work_date'];
    work = json['work'];
    education = json['education'];
    hobbies = json['hobbies'].cast<String>();
    songs = json['songs'].cast<String>();
    images = json['images'].cast<String>();
    bio = json['bio'];
    if (json['moment'] != null) {
      moment = new List<Moment>();
      json['moment'].forEach((v) {
        moment.add(new Moment.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['name'] = this.name;
    data['birthdate'] = this.birthdate;
    data['work_date'] = this.workDate;
    data['work'] = this.work;
    data['education'] = this.education;
    data['hobbies'] = this.hobbies;
    data['songs'] = this.songs;
    data['images'] = this.images;
    data['bio'] = this.bio;
    if (this.moment != null) {
      data['moment'] = this.moment.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Moment {
  String location;
  String latlong;
  int date;
  List<String> images;

  Moment({this.location, this.latlong, this.date, this.images});

  Moment.fromJson(Map<String, dynamic> json) {
    location = json['location'];
    latlong = json['latlong'];
    date = json['date'];
    images = json['images'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['location'] = this.location;
    data['latlong'] = this.latlong;
    data['date'] = this.date;
    data['images'] = this.images;
    return data;
  }
}
