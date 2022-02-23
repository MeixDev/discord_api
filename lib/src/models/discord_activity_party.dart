class DiscordActivityParty {
  /// the id of the party
  ///
  /// is not always returned, hence the nullable property
  final String? id;

  /// used to show the party's current and maximum size
  ///
  /// is an array of two integers (current_size, max_size)
  final List<int>? size;

  static const idEntry = "id";
  static const sizeEntry = "size";

  DiscordActivityParty({
    this.id,
    this.size,
  });

  factory DiscordActivityParty.fromJson(Map<String, dynamic> json) =>
      DiscordActivityParty(
        id: json[idEntry] as String?,
        size: List<int>.from(json[sizeEntry] as List<int>),
      );
}
