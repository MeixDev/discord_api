import 'package:discord_api/src/models/discord_snowflake.dart';
import 'package:discord_api/src/models/discord_user.dart';

class DiscordIntegrationApplication {
  /// the id of the app
  final DiscordSnowflake id;

  /// the name of the app
  final String name;

  /// the [icon hash](https://discord.com/developers/docs/reference#image-formatting)
  /// of the app
  ///
  /// is always returned, but can be null
  final String? icon;

  /// the description ofthe app
  final String description;

  /// the summary of the app
  final String summary;

  /// the bot associated with this application
  ///
  /// is not always returned, hence the nullable property
  final DiscordUser? bot;

  static const idEntry = 'id';
  static const nameEntry = 'name';
  static const iconEntry = 'icon';
  static const descriptionEntry = 'description';
  static const summaryEntry = 'summary';
  static const botEntry = 'bot';

  DiscordIntegrationApplication._({
    required this.id,
    required this.name,
    this.icon,
    required this.description,
    required this.summary,
    this.bot,
  });

  factory DiscordIntegrationApplication.fromJson(Map<String, dynamic> json) => DiscordIntegrationApplication._(
      id: DiscordSnowflake(json[idEntry] as String),
      name: json[nameEntry] as String,
      icon: json[iconEntry] as String?,
      description: json[descriptionEntry] as String,
      summary: json[summaryEntry] as String,
      bot: DiscordUser.fromJson(json[botEntry] as Map<String, dynamic>),
    );
}
