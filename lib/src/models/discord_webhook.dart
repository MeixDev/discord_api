class DiscordWebhook {
  final String applicationId;
  final String name;
  final String url;
  final String channelId;
  final String token;
  final int type;
  final String? avatar;
  final String guildId;
  final String id;

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