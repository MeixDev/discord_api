import 'discord_role_tags.dart';
import 'discord_snowflake.dart';

class DiscordRole {
  final DiscordSnowflake id;
  final String name;
  final int? color;
  final bool? hoist;
  final String? icon;
  final String? unicodeEmoji;
  final int? position;
  final String? permissions;
  final bool? managed;
  final bool? mentionable;
  final DiscordRoleTags? tags;

  static const idEntry = 'id';
  static const nameEntry = 'name';
  static const colorEntry = 'color';
  static const hoistEntry = 'hoist';
  static const iconEntry = 'icon';
  static const unicodeEmojiEntry = 'unicode_emoji';
  static const positionEntry = 'position';
  static const permissionsEntry = 'permissions';
  static const managedEntry = 'managed';
  static const mentionableEntry = 'mentionable';
  static const tagsEntry = 'tags';

  DiscordRole({
    required this.id,
    required this.name,
    this.color,
    this.hoist,
    this.icon,
    this.unicodeEmoji,
    this.position,
    this.permissions,
    this.managed,
    this.mentionable,
    this.tags,
  });

  factory DiscordRole.fromJson(Map<String, dynamic> json) => DiscordRole(
        id: DiscordSnowflake(json[idEntry] as String),
        name: json[nameEntry] as String,
        color: json[colorEntry] as int?,
        hoist: json[hoistEntry] as bool?,
        icon: json[iconEntry] as String?,
        unicodeEmoji: json[unicodeEmojiEntry] as String?,
        position: json[positionEntry] as int?,
        permissions: json[permissionsEntry] as String?,
        managed: json[managedEntry] as bool?,
        mentionable: json[mentionableEntry] as bool?,
        tags: json[tagsEntry] != null
            ? DiscordRoleTags.fromJson(json[tagsEntry] as Map<String, dynamic>)
            : null,
      );
}
