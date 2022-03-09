import 'discord_snowflake.dart';
import 'discord_user.dart';

class DiscordEmoji {
  /// [emoji id](https://discord.com/developers/docs/reference#image-formatting)
  final DiscordSnowflake? id;

  /// emoji name
  final String? name;

  /// roles allowed to use this emoji
  final List<String>? roles;

  /// user that created this emoji
  final DiscordUser? user;

  /// whether this emoji must be wrapped in colons
  final bool? requireColons;

  /// whether this emoji is managed
  final bool? managed;

  /// whether this emoji is animated
  final bool? animated;

  /// whether this emoji can be used, may be false due to loss of Server Boosts
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
        id: json[idEntry] != null
            ? DiscordSnowflake(json[idEntry] as String)
            : null,
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
