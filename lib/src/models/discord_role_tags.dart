import 'discord_snowflake.dart';

class DiscordRoleTags {
  final DiscordSnowflake? botId;
  final DiscordSnowflake? integrationId;

  /// Whether this is the guild's premium subscriber role.
  ///
  /// Is actually a field with a type of `null` in the API.
  /// In order to make it work here, we will check if the response
  /// got the key [premiumSubscriberEntry] and if it does, we consider
  /// it true.
  final bool premiumSubscriber;

  static const botIdEntry = 'bot_id';
  static const integrationIdEntry = 'integration_id';
  static const premiumSubscriberEntry = 'premium_subscriber';

  DiscordRoleTags({
    this.botId,
    this.integrationId,
    required this.premiumSubscriber,
  });

  factory DiscordRoleTags.fromJson(Map<String, dynamic> json) {
    return DiscordRoleTags(
      botId: json[botIdEntry] != null
          ? DiscordSnowflake(json[botIdEntry] as String)
          : null,
      integrationId: json[integrationIdEntry]
          ? DiscordSnowflake(json[integrationIdEntry] as String)
          : null,
      premiumSubscriber:
          json.containsKey(premiumSubscriberEntry) ? true : false,
    );
  }
}
