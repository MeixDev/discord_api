import 'discord_team.dart';
import 'discord_user.dart';

class DiscordApplication {
  /// The id of the application as a Discord snowflake.
  final String id;

  final String name;
  final String? icon;
  final String description;

  final List<String>? rpcOrigins;
  final bool botPublic;
  final bool botRequireCodeGrant;
  final String? termsOfServiceUrl;
  final String? privacyPolicyUrl;
  final DiscordUser? owner;
  final String summary;
  final String verifyKey;
  final DiscordTeam? team;
  final String? guildId; // This is a snowflake too.
  final String? primarySkuId; // This is a snowflake too.
  final String? slug;
  final String? coverImage;
  final int? flags;

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

  factory DiscordApplication.fromJson(Map<String, dynamic> json) =>
      DiscordApplication(
        id: json[idEntry] as String,
        name: json[nameEntry] as String,
        icon: json[iconEntry] as String?,
        description: json[descriptionEntry] as String,
        rpcOrigins: json[rpcOriginsEntry] as List<String>?,
        botPublic: json[botPublicEntry] as bool,
        botRequireCodeGrant: json[botRequireCodeGrantEntry] as bool,
        termsOfServiceUrl: json[termsOfServiceUrlEntry] as String?,
        privacyPolicyUrl: json[privacyPolicyUrlEntry] as String?,
        owner: json[ownerEntry] != null
            ? DiscordUser.fromJson(json[ownerEntry])
            : null,
        summary: json[summaryEntry] as String,
        verifyKey: json[verifyKeyEntry] as String,
        team: json[teamEntry] != null
            ? DiscordTeam.fromJson(json[teamEntry])
            : null,
        guildId: json[guildIdEntry] as String?,
        primarySkuId: json[primarySkuIdEntry] as String?,
        slug: json[slugEntry] as String?,
        coverImage: json[coverImageEntry] as String?,
        flags: json[flagsEntry] as int?,
      );
}
