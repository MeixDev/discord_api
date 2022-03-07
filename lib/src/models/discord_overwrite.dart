import 'discord_snowflake.dart';

class DiscordOverwrite {
  /// role or user id
  final DiscordSnowflake id;

  /// 0 = role, 1 = member
  final int type;

  /// Permission bit set (see [permissions](https://discord.com/developers/docs/topics/permissions#permissions))
  final String allow;

  /// Permission bit set (see [permissions](https://discord.com/developers/docs/topics/permissions#permissions))
  final String deny;

  static const idEntry = 'id';
  static const typeEntry = 'type';
  static const allowEntry = 'allow';
  static const denyEntry = 'deny';

  DiscordOverwrite({
    required this.id,
    required this.type,
    required this.allow,
    required this.deny,
  });

  factory DiscordOverwrite.fromJson(Map<String, dynamic> json) =>
      DiscordOverwrite(
        id: DiscordSnowflake(json[idEntry] as String),
        type: json[typeEntry] as int,
        allow: json[allowEntry] as String,
        deny: json[denyEntry] as String,
      );
}
