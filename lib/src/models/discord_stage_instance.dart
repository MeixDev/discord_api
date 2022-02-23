import 'discord_snowflake.dart';
import 'discord_stage_privacy_level.dart';

class DiscordStageInstance {
  /// The id of this Stage instance
  final DiscordSnowflake id;

  /// The guild id of the associated Stage channel
  final DiscordSnowflake guildId;

  /// The id of the associated Stage channel
  final DiscordSnowflake channelId;

  /// The topic of the Stage instance (1-120 characters)
  final String topic;

  /// The [privacy level](https://discord.com/developers/docs/resources/stage-instance#stage-instance-object-privacy-level)
  /// of the Stage instance
  final int privacyLevel;

  late final DiscordStagePrivacyLevel? _privacyLevelAsEnum;

  /// Whether or not Stage Discovery is disabled (deprecated)
  final bool discoverableDisabled;

  static const idEntry = 'id';
  static const guildIdEntry = 'guild_id';
  static const channelIdEntry = 'channel_id';
  static const topicEntry = 'topic';
  static const privacyLevelEntry = 'privacy_level';
  static const discoverableDisabledEntry = 'discoverable_disabled';

  DiscordStageInstance({
    required this.id,
    required this.guildId,
    required this.channelId,
    required this.topic,
    required this.privacyLevel,
    required this.discoverableDisabled,
  });

  DiscordStagePrivacyLevel get privacyLevelAsEnum {
    _privacyLevelAsEnum ??= DiscordStagePrivacyLevel.values[privacyLevel];
    return _privacyLevelAsEnum!;
  }

  factory DiscordStageInstance.fromJson(Map<String, dynamic> json) =>
      DiscordStageInstance(
        id: DiscordSnowflake(json[idEntry] as String),
        guildId: DiscordSnowflake(json[guildIdEntry] as String),
        channelId: DiscordSnowflake(json[channelIdEntry] as String),
        topic: json[topicEntry] as String,
        privacyLevel: json[privacyLevelEntry] as int,
        discoverableDisabled: json[discoverableDisabledEntry] as bool,
      );
}
