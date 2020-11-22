class Business {
  String legalName;
  String comercialName;
  String email;
  String phoneNumber;
  String address;
  String state;
  String city;
  String businessLine;
  String businessSector;

  Business(business) {
    legalName = business['legalName'];
    comercialName = business['comercialName'];
    email = business['email'];
    phoneNumber = business['phoneNumber'];
    address = business['address'];
    state = business['state'];
    city = business['city'];
    businessLine = business['businessLine'];
    businessSector = business['businessSector'];
  }
}

class Businesses {
  static List<Business> _myBusinesses = [];

  Businesses.fromJson(Map<String, dynamic> parsedJson) {
    if (parsedJson != null &&
        parsedJson.toString() != 'null' &&
        parsedJson.isNotEmpty) {
      _myBusinesses.clear();
      dynamic parsedBusinesses = parsedJson['businesses'];
      for (var i = 0; i < parsedBusinesses.length; i++) {
        Business business = Business(parsedBusinesses[i]);
        _myBusinesses.add(business);
      }
    }
  }

  static List<Business> get myBusinesses => _myBusinesses ?? [];
}
