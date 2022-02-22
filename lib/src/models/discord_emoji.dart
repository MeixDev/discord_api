import 'package:discord_api/src/models/discord_snowflake.dart';

import 'discord_user.dart';

class DiscordEmoji {
  final DiscordSnowflake? id;
  final String? name;
  final List<String>? roles;
  final DiscordUser? user;
  final bool? requireColons;
  final bool? managed;
  final bool? animated;
  final bool? available;

  static const idEntry = 'id';
  static const nameEntry = 'name';
  static const rolesEntry = 'roles';
  static const userEntry = 'user';
  static const requireColonsEntry = 'require_colons';
  static const managedEntry = 'managed';
  static const animatedEntry = 'animated';
  static const availableEntry = 'available';

  DiscordEmoji({
    this.id,
    this.name,
    this.roles,
    this.user,
    this.requireColons,
    this.managed,
    this.animated,
    this.available,
  });

  factory DiscordEmoji.fromJson(Map<String, dynamic> json) => DiscordEmoji(
        id: json[idEntry] != null ? DiscordSnowflake(json[idEntry]) : null,
        name: json[nameEntry] as String?,
        roles: json[rolesEntry] != null
            ? List<String>.from(json[rolesEntry])
            : null,
        user: json[userEntry] != null
            ? DiscordUser.fromJson(json[userEntry])
            : null,
        requireColons: json[requireColonsEntry] as bool?,
        managed: json[managedEntry] as bool?,
        animated: json[animatedEntry] as bool?,
        available: json[availableEntry] as bool?,
      );
}
