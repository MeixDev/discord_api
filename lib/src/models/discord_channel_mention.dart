import 'discord_channel_type.dart';
import 'discord_snowflake.dart';

class DiscordChannelMention {
  final DiscordSnowflake id;
  final DiscordSnowflake guildId;
  final int type;
  late final DiscordChannelType? _typeAsEnum;
  final String name;

  static const idEntry = 'id';
  static const guildIdEntry = 'guild_id';
  static const typeEntry = 'type';
  static const nameEntry = 'name';

  DiscordChannelMention({
    required this.id,
    required this.guildId,
    required this.type,
    required this.name,
  });

  DiscordChannelType? get typeAsEnum =>
      _typeAsEnum ??= DiscordChannelType.values[type];

  factory DiscordChannelMention.fromJson(Map<String, dynamic> json) =>
      DiscordChannelMention(
        id: DiscordSnowflake(json[idEntry] as String),
        guildId: DiscordSnowflake(json[guildIdEntry] as String),
        type: json[typeEntry] as int,
        name: json[nameEntry] as String,
      );
}
