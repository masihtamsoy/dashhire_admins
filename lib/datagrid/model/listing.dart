/// Class contains properties to hold the detailed information about the employee
/// which will be rendered in datagrid.
class ListingSchema {
  /// Creates the employee info class with required details.
  ListingSchema(
      {
      // required this.id,
      required this.email,
      // this.postalCode = "",
      required this.mobile});

  /// Fetch data from json
  factory ListingSchema.fromJson(Map<String, dynamic> json) {
    print("----------${json}");
    return ListingSchema(
        // id: json['id'] as String,
        email: json['email'] as String,
        // postalCode: json['postalCode'] as String,
        mobile: json['mobile'] as String);
    // companyName: json['companyName'] as String,
    // address: json['address'] as String,
    // city: json['city'] as String,
    // country: json['country'] as String,
    // designation: json['designation'] as String,
  }

  /// Id of an employee info.
  // final String id;

  /// Contact name of an employee info.
  final String email;

  /// Postal code of an employee info.
  // String postalCode;

  /// Phone number of an employee info.
  final String mobile;

  // /// Company name of an employee info.
  // final String companyName;

  // /// Address of an employee info.
  // final String address;

  // /// City of an employee info.
  // final String city;

  // /// Country of an employee info.
  // final String country;

  // /// Designation of an employee info.
  // final String designation;

}
