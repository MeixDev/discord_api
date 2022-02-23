import 'discord_membership_state.dart';
import 'discord_snowflake.dart';
import 'discord_user.dart';

class DiscordTeamMember {
  final int membershipState;
  late final DiscordMembershipState? _membershipStateAsEnum;
  final List<String> permissions; // will always be ["*"]
  final DiscordSnowflake teamId;
  final DiscordUser
      user; // partial, only avatar, discriminator, id and username

  static const membershipStateEntry = "membership_state";
  static const permissionsEntry = "permissions";
  static const teamIdEntry = "team_id";
  static const userEntry = "user";

  DiscordTeamMember({
    required this.membershipState,
    required this.permissions,
    required this.teamId,
    required this.user,
  });

  DiscordMembershipState get membershipStateAsEnum =>
      _membershipStateAsEnum ??= DiscordMembershipState.values[membershipState];

  factory DiscordTeamMember.fromJson(Map<String, dynamic> json) =>
      DiscordTeamMember(
        membershipState: json[membershipStateEntry] as int,
        permissions: List<String>.from(json[permissionsEntry]),
        teamId: DiscordSnowflake(json[teamIdEntry] as String),
        user: DiscordUser.fromJson(json[userEntry]),
      );
}
