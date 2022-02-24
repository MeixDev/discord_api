import 'package:discord_api/src/models/discord_guild_member.dart';

import 'discord_message_interaction_type.dart';
import 'discord_user.dart';
import 'discord_snowflake.dart';

class DiscordMessageInteraction {
  /// id of the interaction
  final DiscordSnowflake id;

  /// the type of interaction
  final int type;

  late final DiscordMessageInteractionType? _typeAsEnum;

  /// the name of the [application command](https://discord.com/developers/docs/interactions/application-commands#application-command-object-application-command-structure)
  final String name;

  /// the user who invoked the interaction
  final DiscordUser user;

  /// the member who invoked the interaction in the guild
  final DiscordGuildMember? member;

  static const idEntry = 'id';
  static const typeEntry = 'type';
  static const nameEntry = 'name';
  static const userEntry = 'user';
  static const memberEntry = 'member';

  DiscordMessageInteraction({
    required this.id,
    required this.type,
    required this.name,
    required this.user,
    this.member,
  });

  DiscordMessageInteractionType get typeAsEnum =>
      _typeAsEnum ??= DiscordMessageInteractionType.values[type];

  factory DiscordMessageInteraction.fromJson(Map<String, dynamic> json) =>
      DiscordMessageInteraction(
        id: DiscordSnowflake(json[idEntry] as String),
        type: json[typeEntry] as int,
        name: json[nameEntry] as String,
        user: DiscordUser.fromJson(json[userEntry] as Map<String, dynamic>),
        member: json[memberEntry] != null
            ? DiscordGuildMember.fromJson(json[memberEntry])
            : null,
      );
}
