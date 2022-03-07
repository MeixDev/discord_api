import 'discord_guild_member.dart';
import 'discord_user.dart';
import 'discord_snowflake.dart';

class DiscordGuildScheduledEventUser {
  /// the scheduled event id which the user subscribed to
  final DiscordSnowflake guildScheduledEventId;

  /// user which subscribed to an event
  final DiscordUser user;

  /// guild member data for this user for this guild
  /// which this event belongs to, if any
  ///
  /// is not always returned, hence the nullable property
  final DiscordGuildMember? member;

  static const guildScheduledEventIdEntry = 'guild_scheduled_event_id';
  static const userEntry = 'user';
  static const memberEntry = 'member';

  DiscordGuildScheduledEventUser({
    required this.guildScheduledEventId,
    required this.user,
    this.member,
  });

  factory DiscordGuildScheduledEventUser.fromJson(Map<String, dynamic> json) =>
      DiscordGuildScheduledEventUser(
        guildScheduledEventId:
            DiscordSnowflake(json[guildScheduledEventIdEntry] as String),
        user: DiscordUser.fromJson(json[userEntry] as Map<String, dynamic>),
        member: json[memberEntry] != null
            ? DiscordGuildMember.fromJson(
                json[memberEntry] as Map<String, dynamic>)
            : null,
      );
}
