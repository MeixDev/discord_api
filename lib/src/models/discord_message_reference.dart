import 'discord_snowflake.dart';

class DiscordMessageReference {
  /// id of the originating message
  ///
  /// is not always returned, hence the nullable property
  final DiscordSnowflake? messageId;

  /// id of the originating message's channel
  ///
  /// * is optional when creating a reply, but will always
  /// be present when receiving an event/response that includes this data model.
  ///
  /// is not always returned, hence the nullable property
  final DiscordSnowflake? channelId;

  /// id of the originating message's guild
  ///
  /// is not always returned, hence the nullable property
  final DiscordSnowflake? guildId;

  /// when sending, whether to error if the referenced message
  /// doesn't exist instead of sending as a normal (non-reply)
  /// message, default true
  ///
  /// is not always returned, hence the nullable property
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
