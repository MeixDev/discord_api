import 'discord_guild.dart';
import 'discord_snowflake.dart';
import 'discord_user.dart';

class DiscordGuildTemplate {
  /// the template code (unique ID)
  final String code;

  /// template name
  final String name;

  /// the description for the template
  final String? description;

  /// number of times this template has been used
  final int usageCount;

  /// the ID of the user who created this template
  final DiscordSnowflake creatorId;

  /// the user who created this template
  final DiscordUser creator;

  /// when this template was created
  ///
  /// as an ISO8601 string
  final String createdAt;

  late final DateTime? _createdAtAsDateTime;

  /// when this template was last synced to the source guild
  ///
  /// as an ISO8601 string
  final String updatedAt;

  late final DateTime? _updatedAtAsDateTime;

  /// the ID of the guild this template is based on
  final DiscordSnowflake sourceGuildId;

  /// the guild snapshot this template contains
  ///
  /// partial guild object
  final DiscordGuild serializedSourceGuild;

  /// whether the template has unsynced changes
  final bool? isDirty;

  static const codeEntry = 'code';
  static const nameEntry = 'name';
  static const descriptionEntry = 'description';
  static const usageCountEntry = 'usage_count';
  static const creatorIdEntry = 'creator_id';
  static const creatorEntry = 'creator';
  static const createdAtEntry = 'created_at';
  static const updatedAtEntry = 'updated_at';
  static const sourceGuildIdEntry = 'source_guild_id';
  static const serializedSourceGuildEntry = 'serialized_source_guild';
  static const isDirtyEntry = 'is_dirty';

  DiscordGuildTemplate({
    required this.code,
    required this.name,
    this.description,
    required this.usageCount,
    required this.creatorId,
    required this.creator,
    required this.createdAt,
    required this.updatedAt,
    required this.sourceGuildId,
    required this.serializedSourceGuild,
    this.isDirty,
  });

  DateTime get createdAtAsDateTime =>
      _createdAtAsDateTime ??= DateTime.parse(createdAt);

  DateTime get updatedAtAsDateTime =>
      _updatedAtAsDateTime ??= DateTime.parse(updatedAt);

  factory DiscordGuildTemplate.fromJson(Map<String, dynamic> json) =>
      DiscordGuildTemplate(
        code: json[codeEntry] as String,
        name: json[nameEntry] as String,
        description: json[descriptionEntry] as String?,
        usageCount: json[usageCountEntry] as int,
        creatorId: DiscordSnowflake(json[creatorIdEntry] as String),
        creator:
            DiscordUser.fromJson(json[creatorEntry] as Map<String, dynamic>),
        createdAt: json[createdAtEntry] as String,
        updatedAt: json[updatedAtEntry] as String,
        sourceGuildId: DiscordSnowflake(json[sourceGuildIdEntry] as String),
        serializedSourceGuild: DiscordGuild.fromJson(
          json[serializedSourceGuildEntry] as Map<String, dynamic>,
        ),
        isDirty: json[isDirtyEntry] as bool?,
      );
}
