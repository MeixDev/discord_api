import 'discord_snowflake.dart';

class DiscordWelcomeScreenChannel {
  /// the channel's id
  final DiscordSnowflake channelId;

  /// the description shown for the channel
  final String description;

  /// the [emoji id](https://discord.com/developers/docs/reference#image-formatting),
  /// if the emoji is custom
  ///
  /// can be null
  final DiscordSnowflake? emojiId;

  /// the emoji name if custom, the unicode character if standard,
  /// or `null` if no emoji is set
  final String? emojiName;

  static const channelIdEntry = 'channel_id';
  static const descriptionEntry = 'description';
  static const emojiIdEntry = 'emoji_id';
  static const emojiNameEntry = 'emoji_name';

  DiscordWelcomeScreenChannel({
    required this.channelId,
    required this.description,
    this.emojiId,
    this.emojiName,
  });

  factory DiscordWelcomeScreenChannel.fromJson(Map<String, dynamic> json) =>
      DiscordWelcomeScreenChannel(
        channelId: DiscordSnowflake(json[channelIdEntry] as String),
        description: json[descriptionEntry] as String,
        emojiId: json[emojiIdEntry] != null
            ? DiscordSnowflake(json[emojiIdEntry] as String)
            : null,
        emojiName: json[emojiNameEntry] as String?,
      );
}
