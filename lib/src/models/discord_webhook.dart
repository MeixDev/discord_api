import 'discord_channel.dart';
import 'discord_guild.dart';
import 'discord_snowflake.dart';
import 'discord_user.dart';

class DiscordWebhook {
  /// the id of the webhook
  final DiscordSnowflake id;

  /// the [type](https://discord.com/developers/docs/resources/webhook#webhook-object-webhook-types)
  /// of the webhook
  final int type;

  /// the guild id this webhook is for, if any
  ///
  /// is not always returned, and can be null
  final DiscordSnowflake? guildId;

  /// the channel id this webhook is for, if any
  ///
  /// is always returned, but can be null
  final DiscordSnowflake? channelId;

  /// the user this webhook was created by (not returned when getting a webhook with its token)
  ///
  /// is not always returned, hence the nullable property
  final DiscordUser? user;

  /// the default name of the webhook
  ///
  /// is not always returned, hence the nullable property
  final String? name;

  /// the default user avatar [hash](https://discord.com/developers/docs/reference#image-formatting)
  /// of the webhook
  ///
  /// is not always returned, hence the nullable property
  final String? avatar;

  /// the secure token of the webhook (returned for Incoming Webhooks)
  ///
  /// is not always returned, hence the nullable property
  final String? token;

  /// the bot/OAuth2 application that created this webhook.
  ///
  /// is not always returned, and can be null
  final DiscordSnowflake? applicationId;

  /// the guild of the channel that this webhook is following (returned for Channel Follower Webhooks)
  ///
  /// returns only a partial object
  ///
  /// is not always returned, hence the nullable property
  final DiscordGuild? sourceGuild;

  /// the channel that this webhook is following (returned for Channel Follower Webhooks)
  ///
  /// returns only a partial object
  ///
  /// is not always returned, hence the nullable property
  final DiscordChannel? sourceChannel;

  /// the url used for executing the webhook (returned by the [webhooks](https://discord.com/developers/docs/topics/oauth2#webhooks)
  /// OAuth2 flow)
  ///
  /// is not always returned, hence the nullable property
  final String? url;

  static const idEntry = 'id';
  static const typeEntry = 'type';
  static const guildIdEntry = 'guild_id';
  static const channelIdEntry = 'channel_id';
  static const userEntry = 'user';
  static const nameEntry = 'name';
  static const avatarEntry = 'avatar';
  static const tokenEntry = 'token';
  static const applicationIdEntry = 'application_id';
  static const sourceGuildEntry = 'source_guild';
  static const sourceChannelEntry = 'source_channel';
  static const urlEntry = 'url';

  DiscordWebhook({
    required this.id,
    required this.type,
    this.guildId,
    this.channelId,
    this.user,
    this.name,
    this.avatar,
    this.token,
    this.applicationId,
    this.sourceGuild,
    this.sourceChannel,
    this.url,
  });

  factory DiscordWebhook.fromJson(Map<String, dynamic> json) => DiscordWebhook(
        id: DiscordSnowflake(json[idEntry] as String),
        type: json[typeEntry] as int,
        guildId: json[guildIdEntry] != null
            ? DiscordSnowflake(json[guildIdEntry] as String)
            : null,
        channelId: json[channelIdEntry] != null
            ? DiscordSnowflake(json[channelIdEntry] as String)
            : null,
        user: json[userEntry] != null
            ? DiscordUser.fromJson(json[userEntry] as Map<String, dynamic>)
            : null,
        name: json[nameEntry] as String?,
        avatar: json[avatarEntry] as String?,
        token: json[tokenEntry] as String?,
        applicationId: json[applicationIdEntry] != null
            ? DiscordSnowflake(json[applicationIdEntry] as String)
            : null,
        sourceGuild: json[sourceGuildEntry] != null
            ? DiscordGuild.fromJson(
                json[sourceGuildEntry] as Map<String, dynamic>)
            : null,
        sourceChannel: json[sourceChannelEntry] != null
            ? DiscordChannel.fromJson(
                json[sourceChannelEntry] as Map<String, dynamic>)
            : null,
        url: json[urlEntry] as String?,
      );
}
