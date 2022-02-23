import 'discord_snowflake.dart';
import 'discord_team_member.dart';

class DiscordTeam {
  final DiscordSnowflake id;

  final String? icon;
  final List<DiscordTeamMember>? members;
  final String name;
  final DiscordSnowflake ownerUserId;

  static const idEntry = 'id';
  static const iconEntry = 'icon';
  static const membersEntry = 'members';
  static const nameEntry = 'name';
  static const ownerUserIdEntry = 'owner_user_id';

  DiscordTeam({
    required this.id,
    this.icon,
    this.members,
    required this.name,
    required this.ownerUserId,
  });

  factory DiscordTeam.fromJson(Map<String, dynamic> json) => DiscordTeam(
        id: DiscordSnowflake(json[idEntry] as String),
        icon: json[iconEntry] as String?,
        members: (json[membersEntry] as Iterable?)
            ?.cast<Map<String, dynamic>>()
            .map(DiscordTeamMember.fromJson)
            .toList(),
        name: json[nameEntry] as String,
        ownerUserId: DiscordSnowflake(json[ownerUserIdEntry] as String),
      );
}
