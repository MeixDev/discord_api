import 'package:discord_api/src/models/discord_visibility_type.dart';

import 'discord_integration.dart';

class DiscordConnection {
  /// id of the connection account
  final String id;

  /// the username of the connection account
  final String name;

  /// the service of the connection (twitch, youtube)
  final String type;

  /// whether the connection is revoked
  final bool? revoked;

  /// an array of partial [server integrations](https://discord.com/developers/docs/resources/guild#integration-object)
  final List<DiscordIntegration>? integrations;

  /// whether the connection is verified
  final bool verified;

  /// whether friend sync is enabled for this connection
  final bool friendSync;

  /// whether activities related to this connection will be shown in presence updates
  final bool showActivity;

  /// [visibility](https://discord.com/developers/docs/resources/user#connection-object-visibility-types)
  /// of this connection
  final int visibility;

  late final DiscordVisibilityType? _visibilityAsEnum;

  static const idEntry = 'id';
  static const nameEntry = 'name';
  static const typeEntry = 'type';
  static const revokedEntry = 'revoked';
  static const integrationsEntry = 'integrations';
  static const verifiedEntry = 'verified';
  static const friendSyncEntry = 'friend_sync';
  static const showActivityEntry = 'show_activity';
  static const visibilityEntry = 'visibility';

  DiscordConnection({
    required this.id,
    required this.name,
    required this.type,
    this.revoked,
    this.integrations,
    required this.verified,
    required this.friendSync,
    required this.showActivity,
    required this.visibility,
  });

  DiscordVisibilityType get visibilityAsEnum =>
      _visibilityAsEnum ??= DiscordVisibilityType.values[visibility];

  factory DiscordConnection.fromJson(Map<String, dynamic> json) =>
      DiscordConnection(
        id: json[idEntry] as String,
        name: json[nameEntry] as String,
        type: json[typeEntry] as String,
        revoked: json[revokedEntry] as bool?,
        integrations: json[integrationsEntry] != null
            ? List<DiscordIntegration>.from(
                json[integrationsEntry].map(DiscordIntegration.fromJson),
              )
            : null,
        verified: json[verifiedEntry] as bool,
        friendSync: json[friendSyncEntry] as bool,
        showActivity: json[showActivityEntry] as bool,
        visibility: json[visibilityEntry] as int,
      );
}
