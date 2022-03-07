import 'discord_snowflake.dart';

class DiscordFollowedChannel {
  /// source channel id
  final DiscordSnowflake channelId;

  /// created target webhook id
  final DiscordSnowflake webhookId;

  static const channelIdEntry = 'channel_id';
  static const webhookIdEntry = 'webhook_id';

  DiscordFollowedChannel({
    required this.channelId,
    required this.webhookId,
  });

  factory DiscordFollowedChannel.fromJson(Map<String, dynamic> json) =>
      DiscordFollowedChannel(
        channelId: DiscordSnowflake(json[channelIdEntry] as String),
        webhookId: DiscordSnowflake(json[webhookIdEntry] as String),
      );
}
