/// Class contains properties to hold the detailed information about the ListingSchema
/// which will be rendered in datagrid.
class ListingSchema {
  /// Creates the ListingSchema info class with required details.
  ListingSchema({
    this.metadata,
  });

  /// Fetch data from json
  factory ListingSchema.fromJson(Map<String, dynamic> json) {
    // print("----------${json}");

    return ListingSchema(metadata: json);
  }

  /// metadate contain API data metadata = [{}, {}]
  final dynamic metadata;
}
