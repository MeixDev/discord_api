import 'package:discord_api/src/models/discord_snowflake.dart';

class DiscordWebhook {
  final DiscordSnowflake applicationId;
  final String name;
  final String url;
  final DiscordSnowflake channelId;
  final String token;
  final int type;
  final String? avatar;
  final DiscordSnowflake guildId;
  final DiscordSnowflake id;

  static const applicationIdEntry = 'application_id';
  static const nameEntry = 'name';
  static const urlEntry = 'url';
  static const channelIdEntry = 'channel_id';
  static const tokenEntry = 'token';
  static const typeEntry = 'type';
  static const avatarEntry = 'avatar';
  static const guildIdEntry = 'guild_id';
  static const idEntry = 'id';

  DiscordWebhook({
    required this.applicationId,
    required this.name,
    required this.url,
    required this.channelId,
    required this.token,
    required this.type,
    required this.avatar,
    required this.guildId,
    required this.id,
  });
}
