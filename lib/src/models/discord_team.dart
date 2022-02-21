import 'discord_team_member.dart';

class DiscordTeam {
  /// This is a Discord snowflake representing the team.
  final String id;

  final String? icon;
  final List<DiscordTeamMember>? members;
  final String name;
  final String ownerUserId; // This is a snowflake too.

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
        id: json[idEntry] as String,
        icon: json[iconEntry] as String?,
        members: (json[membersEntry] as Iterable?)
            ?.cast<Map<String, dynamic>>()
            .map(DiscordTeamMember.fromJson)
            .toList(),
        name: json[nameEntry] as String,
        ownerUserId: json[ownerUserIdEntry] as String,
      );
}
