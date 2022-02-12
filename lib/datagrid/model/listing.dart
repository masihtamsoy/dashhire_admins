/// Class contains properties to hold the detailed information about the employee
/// which will be rendered in datagrid.
class ListingSchema {
  /// Creates the employee info class with required details.
  ListingSchema(
      {required this.id,
      required this.contactName,
      required this.companyName,
      required this.address,
      required this.city,
      required this.country,
      required this.designation,
      required this.postalCode,
      required this.phoneNumber});

  /// Fetch data from json
  factory ListingSchema.fromJson(Map<String, dynamic> json) {
    return ListingSchema(
        id: json['id'] as String,
        contactName: json['contactName'] as String,
        companyName: json['companyName'] as String,
        address: json['address'] as String,
        city: json['city'] as String,
        country: json['country'] as String,
        designation: json['designation'] as String,
        postalCode: json['postalCode'] as String,
        phoneNumber: json['phoneNumber'] as String);
  }

  /// Id of an employee info.
  final String id;

  /// Contact name of an employee info.
  final String contactName;

  /// Company name of an employee info.
  final String companyName;

  /// Address of an employee info.
  final String address;

  /// City of an employee info.
  final String city;

  /// Country of an employee info.
  final String country;

  /// Designation of an employee info.
  final String designation;

  /// Postal code of an employee info.
  final String postalCode;

  /// Phone number of an employee info.
  final String phoneNumber;
}
