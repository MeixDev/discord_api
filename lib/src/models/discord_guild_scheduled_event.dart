import 'package:discord_api/src/models/discord_user.dart';

import 'discord_guild_scheduled_event_entity_metadata.dart';
import 'discord_guild_scheduled_event_entity_type.dart';
import 'discord_guild_scheduled_event_privacy_level.dart';
import 'discord_guild_scheduled_event_status.dart';
import 'discord_snowflake.dart';

class DiscordGuildScheduledEvent {
  /// the id of the scheduled event
  final DiscordSnowflake id;

  /// the guild id which the scheduled event belongs to
  final DiscordSnowflake guildId;

  /// the channel id in which the scheduled event will be hosted,
  /// or `null` if [scheduled entity type](https://discord.com/developers/docs/resources/guild-scheduled-event#guild-scheduled-event-object-guild-scheduled-event-entity-types) is `EXTERNAL`
  ///
  /// * See [field requirements by entity type](https://discord.com/developers/docs/resources/guild-scheduled-event#guild-scheduled-event-object-field-requirements-by-entity-type)
  /// to understand the relationship between `entity_type` and the
  /// following fields: `channel_id`, `entity_metadata`, and `scheduled_end_time`
  ///
  /// can be null
  final DiscordSnowflake? channelId;

  /// the id of the user that created the scheduled event
  ///
  /// * `creator_id` will be null and `creator` will not be
  /// included for events created before October 25th, 2021,
  /// when the concept of `creator_id` was introduced and tracked.
  ///
  /// is not always returned, and can be null
  final DiscordSnowflake? creatorId;

  /// the name of the scheduled event (1-100 characters)
  final String name;

  /// the description of the scheduled event (0-1000 characters)
  ///
  /// is not always returned, hence the nullable property
  final String? description;

  /// the time the scheduled event will start,
  /// as an ISO 8601 datetime string
  final String scheduledStartTime;

  /// the time the scheduled event will end,
  /// required if `entity_type` is `EXTERNAL`,
  /// as an ISO 8601 datetime string
  ///
  /// * See [field requirements by entity type](https://discord.com/developers/docs/resources/guild-scheduled-event#guild-scheduled-event-object-field-requirements-by-entity-type)
  /// to understand the relationship between `entity_type` and the
  /// following fields: `channel_id`, `entity_metadata`, and `scheduled_end_time`
  ///
  /// can be null
  final String? scheduledEndTime;

  /// the privacy level of the scheduled event
  final int privacyLevel;

  late final DiscordGuildScheduledEventPrivacyLevel? _privacyLevelAsEnum;

  /// the status of the scheduled event
  final int status;

  late final DiscordGuildScheduledEventStatus? _statusAsEnum;

  /// the type of the scheduled event
  final int entityType;

  late final DiscordGuildScheduledEventEntityType? _entityTypeAsEnum;

  /// the id of an entity associated with a guild scheduled event
  ///
  /// can be null
  final DiscordSnowflake? entityId;

  /// the additional metadata for the scheduled event
  ///
  /// * See [field requirements by entity type](https://discord.com/developers/docs/resources/guild-scheduled-event#guild-scheduled-event-object-field-requirements-by-entity-type)
  /// to understand the relationship between `entity_type` and the
  /// following fields: `channel_id`, `entity_metadata`, and `scheduled_end_time`
  ///
  /// can be null
  final DiscordGuildScheduledEventEntityMetadata? entityMetadata;

  /// the user that created the scheduled event
  ///
  /// can be null
  final DiscordUser? creator;

  /// the number of users subscribed to the scheduled event
  ///
  /// is not always returned, hence the nullable property
  final int? userCount;

  /// the [cover image hash](https://discord.com/developers/docs/reference#image-formatting)
  /// of the scheduled event
  ///
  /// can be null
  final String? image;

  static const idEntry = 'id';
  static const guildIdEntry = 'guild_id';
  static const channelIdEntry = 'channel_id';
  static const creatorIdEntry = 'creator_id';
  static const nameEntry = 'name';
  static const descriptionEntry = 'description';
  static const scheduledStartTimeEntry = 'scheduled_start_time';
  static const scheduledEndTimeEntry = 'scheduled_end_time';
  static const privacyLevelEntry = 'privacy_level';
  static const statusEntry = 'status';
  static const entityTypeEntry = 'entity_type';
  static const entityIdEntry = 'entity_id';
  static const entityMetadataEntry = 'entity_metadata';
  static const creatorEntry = 'creator';
  static const userCountEntry = 'user_count';
  static const imageEntry = 'image';

  DiscordGuildScheduledEvent({
    required this.id,
    required this.guildId,
    this.channelId,
    this.creatorId,
    required this.name,
    this.description,
    required this.scheduledStartTime,
    this.scheduledEndTime,
    required this.privacyLevel,
    required this.status,
    required this.entityType,
    this.entityId,
    this.entityMetadata,
    this.creator,
    this.userCount,
    this.image,
  });

  DiscordGuildScheduledEventPrivacyLevel get privacyLevelAsEnum {
    _privacyLevelAsEnum ??=
        DiscordGuildScheduledEventPrivacyLevel.values[privacyLevel];
    return _privacyLevelAsEnum!;
  }

  DiscordGuildScheduledEventStatus get statusAsEnum {
    _statusAsEnum ??= DiscordGuildScheduledEventStatus.values[status];
    return _statusAsEnum!;
  }

  DiscordGuildScheduledEventEntityType get entityTypeAsEnum {
    _entityTypeAsEnum ??=
        DiscordGuildScheduledEventEntityType.values[entityType];
    return _entityTypeAsEnum!;
  }

  factory DiscordGuildScheduledEvent.fromJson(Map<String, dynamic> json) =>
      DiscordGuildScheduledEvent(
        id: DiscordSnowflake(json[idEntry]),
        guildId: DiscordSnowflake(json[guildIdEntry]),
        channelId: json[channelIdEntry] != null
            ? DiscordSnowflake(json[channelIdEntry])
            : null,
        creatorId: json[creatorIdEntry] != null
            ? DiscordSnowflake(json[creatorIdEntry])
            : null,
        name: json[nameEntry] as String,
        description: json[descriptionEntry] as String?,
        scheduledStartTime: json[scheduledStartTimeEntry] as String,
        scheduledEndTime: json[scheduledEndTimeEntry] as String?,
        privacyLevel: json[privacyLevelEntry] as int,
        status: json[statusEntry] as int,
        entityType: json[entityTypeEntry] as int,
        entityId: json[entityIdEntry] != null
            ? DiscordSnowflake(json[entityIdEntry])
            : null,
        entityMetadata: json[entityMetadataEntry] != null
            ? DiscordGuildScheduledEventEntityMetadata.fromJson(
                json[entityMetadataEntry] as Map<String, dynamic>)
            : null,
        creator: json[creatorEntry] != null
            ? DiscordUser.fromJson(json[creatorEntry] as Map<String, dynamic>)
            : null,
        userCount: json[userCountEntry] as int?,
        image: json[imageEntry] as String?,
      );
}
