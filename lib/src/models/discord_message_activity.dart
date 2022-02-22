import 'discord_message_activity_type.dart';

class DiscordMessageActivity {
  final int type;
  late final DiscordMessageActivityType? _typeAsEnum;
  final String? partyId;

  static const typeEntry = 'type';
  static const partyIdEntry = 'party_id';

  DiscordMessageActivity({
    required this.type,
    this.partyId,
  });

  DiscordMessageActivityType get typeAsEnum =>
      _typeAsEnum ??= DiscordMessageActivityType.values[type];

  factory DiscordMessageActivity.fromJson(Map<String, dynamic> json) =>
      DiscordMessageActivity(
        type: json[typeEntry] as int,
        partyId: json[partyIdEntry] as String?,
      );
}
