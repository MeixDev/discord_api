import 'package:discord_api/src/models/discord_membership_state.dart';
import 'package:discord_api/src/models/discord_user.dart';

class DiscordTeamMember {
  final int membershipState;
  late final DiscordMembershipState? _membershipStateAsEnum;
  final List<String> permissions; // will always be ["*"]
  final String teamId; // is a Snowflake
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
        membershipState: json[membershipStateEntry],
        permissions: List<String>.from(json[permissionsEntry]),
        teamId: json[teamIdEntry],
        user: DiscordUser.fromJson(json[userEntry]),
      );
}
