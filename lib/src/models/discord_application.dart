import 'discord_application_flag.dart';
import 'discord_snowflake.dart';
import 'discord_team.dart';
import 'discord_user.dart';

class DiscordApplication {
  /// the id of the app
  final DiscordSnowflake id;

  /// the name of the app
  final String name;

  /// the [icon hash](https://discord.com/developers/docs/reference#image-formatting) of the app
  ///
  /// is always returned, but can be null
  final String? icon;

  /// the description of the app
  final String description;

  /// an array of rpc origin urls, if rpc is enabled
  ///
  /// is not always returned, hence the nullable property
  final List<String>? rpcOrigins;

  /// when false only app owner can join the app's bot to guilds
  final bool botPublic;

  /// when true the app's bot will only join upon completion of the full oauth2
  /// code grant flow
  final bool botRequireCodeGrant;

  /// the url of the app's terms of service
  ///
  /// is not always returned, hence the nullable property
  final String? termsOfServiceUrl;

  /// the url of the app's privacy policy
  ///
  /// is not always returned, hence the nullable property
  final String? privacyPolicyUrl;

  /// partial user object containing info on the owner of the application
  ///
  /// is not always returned, hence the nullable property
  final DiscordUser? owner;

  /// if this application is a game sold on Discord,
  /// this field will be the summary field for the store page of its primary sku
  final String summary;

  /// the hex encoded key for verification in interactions and the
  /// GameSDK's [GetTicket](https://discord.com/developers/docs/game-sdk/applications#getticket)
  final String verifyKey;

  /// if the application belongs to a team, this will be a list of the members of that team
  ///
  /// is always returned, but can be null
  final DiscordTeam? team;

  ///	if this application is a game sold on Discord, this field
  /// will be the guild to which it has been linked
  ///
  /// is not always returned, hence the nullable property
  final DiscordSnowflake? guildId;

  /// if this application is a game sold on Discord, this field
  /// will be the id of the "Game SKU" that is created, if exists
  ///
  /// is not always returned, hence the nullable property
  final DiscordSnowflake? primarySkuId;

  /// if this application is a game sold on Discord, this field
  /// will be the URL slug that links to the store page
  ///
  /// is not always returned, hence the nullable property
  final String? slug;

  /// 	the application's default rich presence invite [cover image hash](https://discord.com/developers/docs/reference#image-formatting)
  ///
  /// is not always returned, hence the nullable property
  final String? coverImage;

  /// the application's public [flags](https://discord.com/developers/docs/resources/application#application-object-application-flags)
  ///
  /// is not always returned, hence the nullable property
  final int? flags;

  late final List<DiscordApplicationFlag>? _flagsAsEnum;

  static const idEntry = 'id';
  static const nameEntry = 'name';
  static const iconEntry = 'icon';
  static const descriptionEntry = 'description';
  static const rpcOriginsEntry = 'rpc_origins';
  static const botPublicEntry = 'bot_public';
  static const botRequireCodeGrantEntry = 'bot_require_code_grant';
  static const termsOfServiceUrlEntry = 'terms_of_service_url';
  static const privacyPolicyUrlEntry = 'privacy_policy_url';
  static const ownerEntry = 'owner';
  static const summaryEntry = 'summary';
  static const verifyKeyEntry = 'verify_key';
  static const teamEntry = 'team';
  static const guildIdEntry = 'guild_id';
  static const primarySkuIdEntry = 'primary_sku_id';
  static const slugEntry = 'slug';
  static const coverImageEntry = 'cover_image';
  static const flagsEntry = 'flags';

  DiscordApplication({
    required this.id,
    required this.name,
    this.icon,
    required this.description,
    this.rpcOrigins,
    required this.botPublic,
    required this.botRequireCodeGrant,
    this.termsOfServiceUrl,
    this.privacyPolicyUrl,
    this.owner,
    required this.summary,
    required this.verifyKey,
    this.team,
    this.guildId,
    this.primarySkuId,
    this.slug,
    this.coverImage,
    this.flags,
  });

  List<DiscordApplicationFlag> get flagsAsEnum =>
      _flagsAsEnum ??= discordApplicationFlagsAsEnum(flags);

  factory DiscordApplication.fromJson(Map<String, dynamic> json) =>
      DiscordApplication(
        id: DiscordSnowflake(json[idEntry] as String),
        name: json[nameEntry] as String,
        icon: json[iconEntry] as String?,
        description: json[descriptionEntry] as String,
        rpcOrigins: json[rpcOriginsEntry] as List<String>?,
        botPublic: json[botPublicEntry] as bool,
        botRequireCodeGrant: json[botRequireCodeGrantEntry] as bool,
        termsOfServiceUrl: json[termsOfServiceUrlEntry] as String?,
        privacyPolicyUrl: json[privacyPolicyUrlEntry] as String?,
        owner: json[ownerEntry] != null
            ? DiscordUser.fromJson(json[ownerEntry] as Map<String, dynamic>)
            : null,
        summary: json[summaryEntry] as String,
        verifyKey: json[verifyKeyEntry] as String,
        team: json[teamEntry] != null
            ? DiscordTeam.fromJson(json[teamEntry] as Map<String, dynamic>)
            : null,
        guildId: json[guildIdEntry] != null
            ? DiscordSnowflake(json[guildIdEntry] as String)
            : null,
        primarySkuId: json[primarySkuIdEntry] != null
            ? DiscordSnowflake(json[primarySkuIdEntry] as String)
            : null,
        slug: json[slugEntry] as String?,
        coverImage: json[coverImageEntry] as String?,
        flags: json[flagsEntry] as int?,
      );
}
