import 'discord_snowflake.dart';

class DiscordMessageReference {
  final DiscordSnowflake? messageId;
  final DiscordSnowflake? channelId;
  final DiscordSnowflake? guildId;
  final bool? failIfNotExists;

  static const messageIdEntry = 'message_id';
  static const channelIdEntry = 'channel_id';
  static const guildIdEntry = 'guild_id';
  static const failIfNotExistsEntry = 'fail_if_not_exists';

  DiscordMessageReference({
    this.messageId,
    this.channelId,
    this.guildId,
    this.failIfNotExists,
  });

  factory DiscordMessageReference.fromJson(Map<String, dynamic> json) =>
      DiscordMessageReference(
        messageId: json[messageIdEntry] != null
            ? DiscordSnowflake(json[messageIdEntry] as String)
            : null,
        channelId: json[channelIdEntry] != null
            ? DiscordSnowflake(json[channelIdEntry] as String)
            : null,
        guildId: json[guildIdEntry] != null
            ? DiscordSnowflake(json[guildIdEntry] as String)
            : null,
        failIfNotExists: json[failIfNotExistsEntry] as bool?,
      );
}
