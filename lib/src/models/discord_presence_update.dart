import 'discord_activity.dart';
import 'discord_client_status.dart';
import 'discord_snowflake.dart';
import 'discord_status.dart';
import 'discord_user.dart';

class DiscordPresenceUpdate {
  /// the user presence is being updated for
  final DiscordUser user;

  /// id of the guild
  final DiscordSnowflake guildId;

  /// the user's current status
  ///
  /// either "idle", "dnd", "online", or "offline"
  final String status;

  late final DiscordStatus? _statusAsEnum;

  /// user's current activities
  final List<DiscordActivity> activites;

  /// user's platform-dependant status
  final DiscordClientStatus clientStatus;

  static const userEntry = 'user';
  static const guildIdEntry = 'guild_id';
  static const statusEntry = 'status';
  static const activitiesEntry = 'activities';
  static const clientStatusEntry = 'client_status';

  DiscordPresenceUpdate({
    required this.user,
    required this.guildId,
    required this.status,
    required this.activites,
    required this.clientStatus,
  });

  DiscordStatus get statusAsEnum {
    _statusAsEnum ??= DiscordStatus.values.firstWhere((e) => e.name == status);
    return _statusAsEnum!;
  }

  factory DiscordPresenceUpdate.fromJson(Map<String, dynamic> json) =>
      DiscordPresenceUpdate(
        user: DiscordUser.fromJson(json[userEntry] as Map<String, dynamic>),
        guildId: DiscordSnowflake(json[guildIdEntry] as String),
        status: json[statusEntry] as String,
        activites: List<DiscordActivity>.from(
          (json[activitiesEntry] as List<Map<String, dynamic>>)
              .map(DiscordActivity.fromJson),
        ),
        clientStatus: DiscordClientStatus.fromJson(
          json[clientStatusEntry] as Map<String, dynamic>,
        ),
      );
}
