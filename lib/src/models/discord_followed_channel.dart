import 'package:discord_api/src/models/discord_snowflake.dart';

class DiscordFollowedChannel {
  final DiscordSnowflake channelId;
  final DiscordSnowflake webhookId;

  static const channelIdEntry = 'channel_id';
  static const webhookIdEntry = 'webhook_id';

  DiscordFollowedChannel({
    required this.channelId,
    required this.webhookId,
  });

  factory DiscordFollowedChannel.fromJson(Map<String, dynamic> json) =>
      DiscordFollowedChannel(
        channelId: DiscordSnowflake(json[channelIdEntry]),
        webhookId: DiscordSnowflake(json[webhookIdEntry]),
      );
}
