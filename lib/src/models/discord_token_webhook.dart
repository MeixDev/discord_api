import 'discord_snowflake.dart';

class DiscordTokenWebhook {
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

  DiscordTokenWebhook({
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

  factory DiscordTokenWebhook.fromJson(Map<String, dynamic> json) =>
      DiscordTokenWebhook(
        applicationId: DiscordSnowflake(json[applicationIdEntry] as String),
        name: json[nameEntry] as String,
        url: json[urlEntry] as String,
        channelId: DiscordSnowflake(json[channelIdEntry] as String),
        token: json[tokenEntry] as String,
        type: json[typeEntry] as int,
        avatar: json[avatarEntry] as String?,
        guildId: DiscordSnowflake(json[guildIdEntry] as String),
        id: DiscordSnowflake(json[idEntry] as String),
      );
}
