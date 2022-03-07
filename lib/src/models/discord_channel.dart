import 'discord_channel_type.dart';
import 'discord_overwrite.dart';
import 'discord_snowflake.dart';
import 'discord_thread_member.dart';
import 'discord_thread_metadata.dart';
import 'discord_user.dart';
import 'discord_video_quality_mode.dart';

/// TODO: Add Documentation
class DiscordChannel {
  final DiscordSnowflake id;
  final int type;
  late final DiscordChannelType? _typeAsEnum;
  final DiscordSnowflake? guildId;
  final int? position;
  final List<DiscordOverwrite>? permissionOverwrites;
  final String? name;
  final String? topic;
  final bool? nsfw;
  final DiscordSnowflake? lastMessageId;
  final int? bitrate;
  final int? userLimit;
  final int? rateLimitPerUser;
  final List<DiscordUser>? recipients;
  final String? icon;
  final DiscordSnowflake? ownerId;
  final DiscordSnowflake? parentId;
  final String? lastPinTimestamp;
  late final DateTime? _lastPinTimestampAsDateTime;
  final String? rtcRegion; // Id of a voice region
  final int? videoQualityMode;
  late final DiscordVideoQualityMode? _videoQualityModeAsEnum;
  final int? messageCount; // approximative + caps at 50
  final int? memberCount; // approximative + caps at 50
  final DiscordThreadMetadata? threadMetadata;
  final DiscordThreadMember? member;
  final int? defaultAutoArchiveDuration;
  final String? permissions;

  static const idEntry = 'id';
  static const typeEntry = 'type';
  static const guildIdEntry = 'guild_id';
  static const positionEntry = 'position';
  static const permissionOverwritesEntry = 'permission_overwrites';
  static const nameEntry = 'name';
  static const topicEntry = 'topic';
  static const nsfwEntry = 'nsfw';
  static const lastMessageIdEntry = 'last_message_id';
  static const bitrateEntry = 'bitrate';
  static const userLimitEntry = 'user_limit';
  static const rateLimitPerUserEntry = 'rate_limit_per_user';
  static const recipientsEntry = 'recipients';
  static const iconEntry = 'icon';
  static const ownerIdEntry = 'owner_id';
  static const parentIdEntry = 'parent_id';
  static const lastPinTimestampEntry = 'last_pin_timestamp';
  static const rtcRegionEntry = 'rtc_region';
  static const videoQualityModeEntry = 'video_quality_mode';
  static const messageCountEntry = 'message_count';
  static const memberCountEntry = 'member_count';
  static const threadMetadataEntry = 'thread_metadata';
  static const memberEntry = 'member';
  static const defaultAutoArchiveDurationEntry =
      'default_auto_archive_duration';
  static const permissionsEntry = 'permissions';

  DiscordChannel({
    required this.id,
    required this.type,
    this.guildId,
    this.position,
    this.permissionOverwrites,
    this.name,
    this.topic,
    this.nsfw,
    this.lastMessageId,
    this.bitrate,
    this.userLimit,
    this.rateLimitPerUser,
    this.recipients,
    this.icon,
    this.ownerId,
    this.parentId,
    this.lastPinTimestamp,
    this.rtcRegion,
    this.videoQualityMode,
    this.messageCount,
    this.memberCount,
    this.threadMetadata,
    this.member,
    this.defaultAutoArchiveDuration,
    this.permissions,
  });

  DateTime? get lastPinTimestampAsDateTime {
    if (lastPinTimestamp == null) return null;
    _lastPinTimestampAsDateTime ??= DateTime.parse(lastPinTimestamp!);
    return _lastPinTimestampAsDateTime;
  }

  DiscordVideoQualityMode? get videoQualityModeAsEnum {
    if (videoQualityMode == null) return null;
    _videoQualityModeAsEnum ??=
        DiscordVideoQualityMode.values[videoQualityMode!];
  }

  factory DiscordChannel.fromJson(Map<String, dynamic> json) => DiscordChannel(
        id: DiscordSnowflake(json[idEntry] as String),
        type: json[typeEntry] as int,
        guildId: json[guildIdEntry] != null
            ? DiscordSnowflake(json[guildIdEntry] as String)
            : null,
        position: json[positionEntry] as int?,
        permissionOverwrites: json[permissionOverwritesEntry] != null
            ? List<DiscordOverwrite>.from(
                json[permissionOverwritesEntry].map(DiscordOverwrite.fromJson))
            : null,
        name: json[nameEntry] as String?,
        topic: json[topicEntry] as String?,
        nsfw: json[nsfwEntry] as bool?,
        lastMessageId: json[lastMessageIdEntry] != null
            ? DiscordSnowflake(json[lastMessageIdEntry] as String)
            : null,
        bitrate: json[bitrateEntry] as int?,
        userLimit: json[userLimitEntry] as int?,
        rateLimitPerUser: json[rateLimitPerUserEntry] as int?,
        recipients: json[recipientsEntry] != null
            ? List<DiscordUser>.from(
                json[recipientsEntry].map(DiscordUser.fromJson))
            : null,
        icon: json[iconEntry] as String?,
        ownerId: json[ownerIdEntry] != null
            ? DiscordSnowflake(json[ownerIdEntry] as String)
            : null,
        parentId: json[parentIdEntry] != null
            ? DiscordSnowflake(json[parentIdEntry] as String)
            : null,
        lastPinTimestamp: json[lastPinTimestampEntry] as String?,
        rtcRegion: json[rtcRegionEntry] as String?,
        videoQualityMode: json[videoQualityModeEntry] as int?,
        messageCount: json[messageCountEntry] as int?,
        memberCount: json[memberCountEntry] as int?,
        threadMetadata: json[threadMetadataEntry] != null
            ? DiscordThreadMetadata.fromJson(json[threadMetadataEntry])
            : null,
        member: json[memberEntry] != null
            ? DiscordThreadMember.fromJson(json[memberEntry])
            : null,
        defaultAutoArchiveDuration:
            json[defaultAutoArchiveDurationEntry] as int?,
        permissions: json[permissionsEntry] as String?,
      );
}
