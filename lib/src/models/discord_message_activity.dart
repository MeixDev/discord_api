import 'discord_message_activity_type.dart';

class DiscordMessageActivity {
  /// [type of message activity](https://discord.com/developers/docs/resources/channel#message-object-message-activity-types)
  final int type;

  late final DiscordMessageActivityType? _typeAsEnum;

  /// party_id from a [Rich Presence event](https://discord.com/developers/docs/rich-presence/how-to#updating-presence-update-presence-payload-fields)
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
