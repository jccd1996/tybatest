class RestaurantsResponse {
  List<Result>? result;

  RestaurantsResponse({this.result});

  RestaurantsResponse.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      result = <Result>[];
      json['results'].forEach((v) {
        result!.add(new Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  String? fsqId;
  int? distance;
  Geocodes? geocodes;
  String? link;
  Location? location;
  String? name;
  RelatedPlaces? relatedPlaces;
  String? timezone;

  Result(
      {this.fsqId,
      this.distance,
      this.geocodes,
      this.link,
      this.location,
      this.name,
      this.relatedPlaces,
      this.timezone});

  Result.fromJson(Map<String, dynamic> json) {
    fsqId = json['fsq_id'];
    distance = json['distance'];
    geocodes = json['geocodes'] != null
        ? new Geocodes.fromJson(json['geocodes'])
        : null;
    link = json['link'];
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    name = json['name'];
    relatedPlaces = json['related_places'] != null
        ? new RelatedPlaces.fromJson(json['related_places'])
        : null;
    timezone = json['timezone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fsq_id'] = this.fsqId;
    data['distance'] = this.distance;
    if (this.geocodes != null) {
      data['geocodes'] = this.geocodes!.toJson();
    }
    data['link'] = this.link;
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['name'] = this.name;
    if (this.relatedPlaces != null) {
      data['related_places'] = this.relatedPlaces!.toJson();
    }
    data['timezone'] = this.timezone;
    return data;
  }
}

class Categories {
  int? id;
  String? name;
  Icon? icon;

  Categories({this.id, this.name, this.icon});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    icon = json['icon'] != null ? new Icon.fromJson(json['icon']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.icon != null) {
      data['icon'] = this.icon!.toJson();
    }
    return data;
  }
}

class Icon {
  String? prefix;
  String? suffix;

  Icon({this.prefix, this.suffix});

  Icon.fromJson(Map<String, dynamic> json) {
    prefix = json['prefix'];
    suffix = json['suffix'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['prefix'] = this.prefix;
    data['suffix'] = this.suffix;
    return data;
  }
}

class Geocodes {
  Main? main;
  Main? roof;

  Geocodes({this.main, this.roof});

  Geocodes.fromJson(Map<String, dynamic> json) {
    main = json['main'] != null ? new Main.fromJson(json['main']) : null;
    roof = json['roof'] != null ? new Main.fromJson(json['roof']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.main != null) {
      data['main'] = this.main!.toJson();
    }
    if (this.roof != null) {
      data['roof'] = this.roof!.toJson();
    }
    return data;
  }
}

class Main {
  double? latitude;
  double? longitude;

  Main({this.latitude, this.longitude});

  Main.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}

class Location {
  String? address;
  String? country;
  String? crossStreet;
  String? formattedAddress;
  String? locality;
  String? postcode;
  String? region;

  Location(
      {this.address,
      this.country,
      this.crossStreet,
      this.formattedAddress,
      this.locality,
      this.postcode,
      this.region});

  Location.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    country = json['country'];
    crossStreet = json['cross_street'];
    formattedAddress = json['formatted_address'];
    locality = json['locality'];
    postcode = json['postcode'];
    region = json['region'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['country'] = this.country;
    data['cross_street'] = this.crossStreet;
    data['formatted_address'] = this.formattedAddress;
    data['locality'] = this.locality;
    data['postcode'] = this.postcode;
    data['region'] = this.region;
    return data;
  }
}

class RelatedPlaces {
  List<Children>? children;

  RelatedPlaces({this.children});

  RelatedPlaces.fromJson(Map<String, dynamic> json) {
    if (json['children'] != null) {
      children = <Children>[];
      json['children'].forEach((v) {
        children!.add(new Children.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.children != null) {
      data['children'] = this.children!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Children {
  String? fsqId;
  String? name;

  Children({this.fsqId, this.name});

  Children.fromJson(Map<String, dynamic> json) {
    fsqId = json['fsq_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fsq_id'] = this.fsqId;
    data['name'] = this.name;
    return data;
  }
}
