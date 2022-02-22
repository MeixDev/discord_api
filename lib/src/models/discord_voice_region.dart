class DiscordVoiceRegion {
  final String id;
  final String name;
  final bool optimal;
  final bool deprecated;
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
