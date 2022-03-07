class DiscordVoiceRegion {
  /// unique ID for the region
  final String id;

  /// name of the region
  final String name;

  /// true for a single server that is closest to the current user's client
  final bool optimal;

  /// whether this is a deprecated voice region (avoid switching to these)
  final bool deprecated;

  /// whether this is a custom voice region (used for events/etc)
  final bool custom;

  static const idEntry = 'id';
  static const nameEntry = 'name';
  static const optimalEntry = 'optimal';
  static const deprecatedEntry = 'deprecated';
  static const customEntry = 'custom';

  DiscordVoiceRegion({
    required this.id,
    required this.name,
    required this.optimal,
    required this.deprecated,
    required this.custom,
  });

  factory DiscordVoiceRegion.fromJson(Map<String, dynamic> json) =>
      DiscordVoiceRegion(
        id: json[idEntry] as String,
        name: json[nameEntry] as String,
        optimal: json[optimalEntry] as bool,
        deprecated: json[deprecatedEntry] as bool,
        custom: json[customEntry] as bool,
      );
}
