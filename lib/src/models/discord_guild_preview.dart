import 'discord_emoji.dart';
import 'discord_guild_feature.dart';
import 'discord_snowflake.dart';
import 'discord_sticker.dart';

class DiscordGuildPreview {
  /// guild id
  final DiscordSnowflake id;

  /// guild name (2-100 characters)
  final String name;

  /// [icon hash](https://discord.com/developers/docs/reference#image-formatting)
  final String? icon;

  /// [splash hash](https://discord.com/developers/docs/reference#image-formatting)
  final String? splash;

  /// [discovery splash hash](https://discord.com/developers/docs/reference#image-formatting)
  final String? discoverySplash;

  /// custom guild emojis
  final List<DiscordEmoji> emojis;

  /// enabled guild features
  final List<String> features;

  late final List<DiscordGuildFeature>? _featuresAsEnum;

  /// approximate number of members in this guild
  final int approximateMemberCount;

  /// approximate number of online members in this guild
  final int approximatePresenceCount;

  /// the description for the guild, if the guild is discoverable
  final String? description;

  /// custom guild stickers
  final List<DiscordSticker> stickers;

  static const idEntry = 'id';
  static const nameEntry = 'name';
  static const iconEntry = 'icon';
  static const splashEntry = 'splash';
  static const discoverySplashEntry = 'discovery_splash';
  static const emojisEntry = 'emojis';
  static const featuresEntry = 'features';
  static const approximateMemberCountEntry = 'approximate_member_count';
  static const approximatePresenceCountEntry = 'approximate_presence_count';
  static const descriptionEntry = 'description';
  static const stickersEntry = 'stickers';

  DiscordGuildPreview({
    required this.id,
    required this.name,
    this.icon,
    this.splash,
    this.discoverySplash,
    required this.emojis,
    required this.features,
    required this.approximateMemberCount,
    required this.approximatePresenceCount,
    this.description,
    required this.stickers,
  });

  List<DiscordGuildFeature> get featuresAsEnum =>
      _featuresAsEnum ??= discordGuildFeaturesFromValues(features);

  factory DiscordGuildPreview.fromJson(Map<String, dynamic> json) =>
      DiscordGuildPreview(
        id: DiscordSnowflake(json[idEntry] as String),
        name: json[nameEntry] as String,
        icon: json[iconEntry] as String?,
        splash: json[splashEntry] as String?,
        discoverySplash: json[discoverySplashEntry] as String?,
        emojis: List<DiscordEmoji>.from(
          (json[emojisEntry] as List<Map<String, dynamic>>)
              .map(DiscordEmoji.fromJson),
        ),
        features: List<String>.from(json[featuresEntry] as List<String>),
        approximateMemberCount: json[approximateMemberCountEntry] as int,
        approximatePresenceCount: json[approximatePresenceCountEntry] as int,
        description: json[descriptionEntry] as String?,
        stickers: List<DiscordSticker>.from(
          (json[stickersEntry] as List<Map<String, dynamic>>)
              .map(DiscordSticker.fromJson),
        ),
      );
}
