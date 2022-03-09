import 'discord_integration_account.dart';
import 'discord_integration_application.dart';
import 'discord_integration_expiration_behavior.dart';
import 'discord_snowflake.dart';
import 'discord_user.dart';

class DiscordIntegration {
  /// integration id
  final DiscordSnowflake id;

  /// integration name
  final String name;

  /// integration type
  /// valid types are `youtube`, `twitch`, or `discord`.
  final String type;

  /// is this integration enabled
  ///
  /// is supposedly always there, but see [this page](https://discord.com/developers/docs/resources/audit-log#audit-log-object-example-partial-integration-object)
  /// to see that partial integration objects seems to lack this property.
  final bool? enabled;

  /// is this integration syncing
  ///
  /// is not provided for discord bot integrations.
  ///
  /// is not always returned, hence the nullable property.
  final bool? syncing;

  /// id that this integration uses for "subscribers"
  ///
  /// is not provided for discord bot integrations.
  ///
  /// is not always returned, hence the nullable property.
  final DiscordSnowflake? roleId;

  /// whether emoticons should be synced for this integration
  /// (twitch only currently)
  ///
  /// is not provided for discord bot integrations.
  ///
  /// is not always returned, hence the nullable property.
  final bool? enableEmoticons;

  /// the behavior of expiring subscribers
  /// [integration expire behavior](https://discord.com/developers/docs/resources/guild#integration-object-integration-expire-behaviors)
  ///
  /// is not provided for discord bot integrations.
  ///
  /// is not always returned, hence the nullable property.
  final int? expireBehavior;

  late final DiscordIntegrationExpirationBehavior? _expireBehaviorAsEnum;

  /// the grace period (in days) before expiring subscribers
  ///
  /// is not provided for discord bot integrations.
  ///
  /// is not always returned, hence the nullable property.
  final int? expireGracePeriod;

  /// user for this integration
  ///
  /// is not provided for discord bot integrations.
  ///
  /// is not always returned, hence the nullable property.
  final DiscordUser? user;

  /// integration account information
  final DiscordIntegrationAccount account;

  /// when this integration was last synced
  /// as an ISO 8601 string
  ///
  /// is not provided for discord bot integrations.
  ///
  /// is not always returned, hence the nullable property.
  final String? syncedAt;

  late final DateTime? _syncedAtAsDateTime;

  /// how many subscribers this integration has
  ///
  /// is not provided for discord bot integrations.
  ///
  /// is not always returned, hence the nullable property.
  final int? subscriberCount;

  /// has this integration been revoked
  ///
  /// is not provided for discord bot integrations.
  ///
  /// is not always returned, hence the nullable property.
  final bool? revoked;

  /// The bot/OAuth2 application for discord integrations
  ///
  /// is not always returned, hence the nullable property.
  final DiscordIntegrationApplication? application;

  static const idEntry = 'id';
  static const nameEntry = 'name';
  static const typeEntry = 'type';
  static const enabledEntry = 'enabled';
  static const syncingEntry = 'syncing';
  static const roleIdEntry = 'role_id';
  static const enableEmoticonsEntry = 'enable_emoticons';
  static const expireBehaviorEntry = 'expire_behavior';
  static const expireGracePeriodEntry = 'expire_grace_period';
  static const userEntry = 'user';
  static const accountEntry = 'account';
  static const syncedAtEntry = 'synced_at';
  static const subscriberCountEntry = 'subscriber_count';
  static const revokedEntry = 'revoked';
  static const applicationEntry = 'application';

  DiscordIntegration({
    required this.id,
    required this.name,
    required this.type,
    this.enabled,
    this.syncing,
    this.roleId,
    this.enableEmoticons,
    this.expireBehavior,
    this.expireGracePeriod,
    this.user,
    required this.account,
    this.syncedAt,
    this.subscriberCount,
    this.revoked,
    this.application,
  });

  DiscordIntegrationExpirationBehavior? get expireBehaviorAsEnum {
    if (expireBehavior == null) return null;
    return _expireBehaviorAsEnum ??=
        DiscordIntegrationExpirationBehavior.values[expireBehavior!];
  }

  DateTime? get syncedAtAsDateTime {
    return _syncedAtAsDateTime ??=
        syncedAt != null ? DateTime.parse(syncedAt!) : null;
  }

  factory DiscordIntegration.fromJson(Map<String, dynamic> json) =>
      DiscordIntegration(
        id: DiscordSnowflake(json[idEntry] as String),
        name: json[nameEntry] as String,
        type: json[typeEntry] as String,
        enabled: json[enabledEntry] as bool?,
        syncing: json[syncingEntry] as bool?,
        roleId: json[roleIdEntry] != null
            ? DiscordSnowflake(json[roleIdEntry] as String)
            : null,
        enableEmoticons: json[enableEmoticonsEntry] as bool?,
        expireBehavior: json[expireBehaviorEntry] as int?,
        expireGracePeriod: json[expireGracePeriodEntry] as int?,
        user: json[userEntry] != null
            ? DiscordUser.fromJson(json[userEntry] as Map<String, dynamic>)
            : null,
        account: DiscordIntegrationAccount.fromJson(
          json[accountEntry] as Map<String, dynamic>,
        ),
        syncedAt: json[syncedAtEntry] as String?,
        subscriberCount: json[subscriberCountEntry] as int?,
        revoked: json[revokedEntry] as bool?,
        application: json[applicationEntry] != null
            ? DiscordIntegrationApplication.fromJson(
                json[applicationEntry] as Map<String, dynamic>,
              )
            : null,
      );
}
