import 'discord_channel_type.dart';
import 'discord_overwrite.dart';
import 'discord_snowflake.dart';
import 'discord_thread_member.dart';
import 'discord_thread_metadata.dart';
import 'discord_user.dart';
import 'discord_video_quality_mode.dart';

class DiscordChannel {
  /// the id of this channel
  final DiscordSnowflake id;

  /// the [type of channel](https://discord.com/developers/docs/resources/channel#channel-object-channel-types)
  final int type;

  late final DiscordChannelType? _typeAsEnum;

  /// the id of the guild (may be missing for some channel objects received over gateway guild dispatches)
  final DiscordSnowflake? guildId;

  /// sorting position of the channel
  final int? position;

  /// explicit permission overewrites for members and roles
  final List<DiscordOverwrite>? permissionOverwrites;

  /// the name of the channel (1-100 characters)
  final String? name;

  /// the channel topic (0-1024 characters)
  final String? topic;

  /// whether the channel is nsfw
  final bool? nsfw;

  /// the id of the last message sent in this channel (may not point to an existing or valid message)
  final DiscordSnowflake? lastMessageId;

  /// the bitrate (in bits) of the voice channel
  final int? bitrate;

  /// the user limit of the voice channel
  final int? userLimit;

  /// amount of seconds a user has to wait before sending another message (0-21600);
  /// bots, as well as users with the permission `manage_messages` or `manage_channel`, are unaffected
  final int? rateLimitPerUser;

  /// the recipients of the DM
  final List<DiscordUser>? recipients;

  /// icon hash of the group DM
  final String? icon;

  /// id of the creator of the group DM or thread
  final DiscordSnowflake? ownerId;

  /// application id of the group DM creator if it is bot-created
  final DiscordSnowflake? applicationId;

  /// for guild channels: id of the parent category for a channel (each parent category can contain up
  /// to 50 channels), for threads: id of the text channel this thread was created
  final DiscordSnowflake? parentId;

  ///	when the last pinned message was pinned. This may be null in events such as
  /// GUILD_CREATE when a message is not pinned.
  final String? lastPinTimestamp;

  late final DateTime? _lastPinTimestampAsDateTime;

  /// [voice region](https://discord.com/developers/docs/resources/voice#voice-region-object)
  /// id for the voice channel, automatic when set to null
  final String? rtcRegion;

  ///	the camera [video quality mode](https://discord.com/developers/docs/resources/channel#channel-object-video-quality-modes)
  /// of the voice channel, 1 when not present
  final int? videoQualityMode;

  late final DiscordVideoQualityMode? _videoQualityModeAsEnum;

  ///	an approximate count of messages in a thread, stops counting at 50
  final int? messageCount;

  /// an approximate count of users in a thread, stops counting at 50
  final int? memberCount;

  /// thread-specific fields not needed by other channels
  final DiscordThreadMetadata? threadMetadata;

  ///	thread member object for the current user, if they have joined the thread, only included on certain API endpoints
  final DiscordThreadMember? member;

  ///	default duration that the clients (not the API) will use for newly created threads, in minutes,
  /// to automatically archive the thread after recent activity, can be set to: 60, 1440, 4320, 10080
  final int? defaultAutoArchiveDuration;

  ///	computed permissions for the invoking user in the channel, including overwrites, only included
  /// when part of the `resolved` data received on a slash command interaction
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
  static const applicationIdEntry = 'application_id';
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
    this.applicationId,
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

  DiscordChannelType get typeAsEnum =>
      _typeAsEnum ??= DiscordChannelType.values[type];

  DateTime? get lastPinTimestampAsDateTime {
    if (lastPinTimestamp == null) return null;
    return _lastPinTimestampAsDateTime ??= DateTime.parse(lastPinTimestamp!);
  }

  DiscordVideoQualityMode? get videoQualityModeAsEnum {
    if (videoQualityMode == null) return null;
    return _videoQualityModeAsEnum ??=
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
                (json[permissionOverwritesEntry] as List<Map<String, dynamic>>)
                    .map(DiscordOverwrite.fromJson),
              )
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
                (json[recipientsEntry] as List<Map<String, dynamic>>)
                    .map(DiscordUser.fromJson),
              )
            : null,
        icon: json[iconEntry] as String?,
        ownerId: json[ownerIdEntry] != null
            ? DiscordSnowflake(json[ownerIdEntry] as String)
            : null,
        applicationId: json[applicationIdEntry] != null
            ? DiscordSnowflake(json[applicationIdEntry] as String)
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
            ? DiscordThreadMetadata.fromJson(
                json[threadMetadataEntry] as Map<String, dynamic>,
              )
            : null,
        member: json[memberEntry] != null
            ? DiscordThreadMember.fromJson(
                json[memberEntry] as Map<String, dynamic>,
              )
            : null,
        defaultAutoArchiveDuration:
            json[defaultAutoArchiveDurationEntry] as int?,
        permissions: json[permissionsEntry] as String?,
      );
}
