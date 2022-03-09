import 'discord_snowflake.dart';

class DiscordGuildWidgetSettings {
  /// whether the widget is enabled
  final bool enabled;

  /// the widget channel id
  final DiscordSnowflake? channelId;

  static const enabledEntry = 'enabled';
  static const channelIdEntry = 'channel_id';

  const DiscordGuildWidgetSettings({
    required this.enabled,
    this.channelId,
  });

  factory DiscordGuildWidgetSettings.fromJson(Map<String, dynamic> json) {
    return DiscordGuildWidgetSettings(
      enabled: json[enabledEntry] as bool,
      channelId: json[channelIdEntry] != null
          ? DiscordSnowflake(json[channelIdEntry] as String)
          : null,
    );
  }
}
