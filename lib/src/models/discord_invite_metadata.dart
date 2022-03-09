class DiscordInviteMetadata {
  /// number of times the invite has been used
  final int uses;

  /// max number of times the invite can be used
  final int maxUses;

  /// duration (in seconds) after which the invite expires
  final int maxAge;

  /// whether this invite only grants temporary membership
  final bool temporary;

  /// when this invite was created
  ///
  /// as an ISO8601 string
  final String createdAt;

  late final DateTime? _createdAtAsDateTime;

  static const usesEntry = 'uses';
  static const maxUsesEntry = 'max_uses';
  static const maxAgeEntry = 'max_age';
  static const temporaryEntry = 'temporary';
  static const createdAtEntry = 'created_at';

  DiscordInviteMetadata({
    required this.uses,
    required this.maxUses,
    required this.maxAge,
    required this.temporary,
    required this.createdAt,
  });

  DateTime get createdAtAsDateTime =>
      _createdAtAsDateTime ??= DateTime.parse(createdAt);

  factory DiscordInviteMetadata.fromJson(Map<String, dynamic> json) =>
      DiscordInviteMetadata(
        uses: json[usesEntry] as int,
        maxUses: json[maxUsesEntry] as int,
        maxAge: json[maxAgeEntry] as int,
        temporary: json[temporaryEntry] as bool,
        createdAt: json[createdAtEntry] as String,
      );
}
