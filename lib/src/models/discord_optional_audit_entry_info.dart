import 'discord_snowflake.dart';

class DiscordOptionalAuditEntryInfo {
  /// channel in which the entities were targeted
  ///
  /// Available in : MEMBER_MOVE & MESSAGE_PIN & MESSAGE_UNPIN & MESSAGE_DELETE & STAGE_INSTANCE_CREATE & STAGE_INSTANCE_UPDATE & STAGE_INSTANCE_DELETE
  ///
  /// is not always returned, hence the nullable porperty
  final DiscordSnowflake? channelId;

  /// number of entities that were targeted
  ///
  /// Available in : 	MESSAGE_DELETE & MESSAGE_BULK_DELETE & MEMBER_DISCONNECT & MEMBER_MOVE
  ///
  /// is not always returned, hence the nullable porperty
  final String? count;

  /// number of days after which inactive members were kicked
  ///
  /// Available in : MEMBER_PRUNE
  ///
  /// is not always returned, hence the nullable porperty
  final String? deleteMemberDays;

  /// id of the overwritten entity
  ///
  /// Available in : 	CHANNEL_OVERWRITE_CREATE & CHANNEL_OVERWRITE_UPDATE & CHANNEL_OVERWRITE_DELETE
  ///
  /// is not always returned, hence the nullable porperty
  final DiscordSnowflake? id;

  /// number of members removed by the prune
  ///
  /// Available in : MEMBER_PRUNE
  ///
  /// is not always returned, hence the nullable porperty
  final String? membersRemoved;

  /// id of the message that was targeted
  ///
  /// Available in : MESSAGE_PIN & MESSAGE_UNPIN
  ///
  /// is not always returned, hence the nullable porperty
  final DiscordSnowflake? messageId;

  /// name of the role if type is "0" (not present if type is "1")
  ///
  /// Available in : CHANNEL_OVERWRITE_CREATE & CHANNEL_OVERWRITE_UPDATE & CHANNEL_OVERWRITE_DELETE
  ///
  /// is not always returned, hence the nullable porperty
  final String? roleName;

  /// type of overwrriten entity - "0" for "role" or "1" for "member"
  ///
  /// Available in : CHANNEL_OVERWRITE_CREATE & CHANNEL_OVERWRITE_UPDATE & CHANNEL_OVERWRITE_DELETE
  ///
  /// is not always returned, hence the nullable porperty
  final String? type;

  static const channelIdEntry = "channel_id";
  static const countEntry = "count";
  static const deleteMemberDaysEntry = "delete_member_days";
  static const idEntry = "id";
  static const membersRemovedEntry = "members_removed";
  static const messageIdEntry = "message_id";
  static const roleNameEntry = "role_name";
  static const typeEntry = "type";

  DiscordOptionalAuditEntryInfo({
    this.channelId,
    this.count,
    this.deleteMemberDays,
    this.id,
    this.membersRemoved,
    this.messageId,
    this.roleName,
    this.type,
  });

  factory DiscordOptionalAuditEntryInfo.fromJson(Map<String, dynamic> json) =>
      DiscordOptionalAuditEntryInfo(
        channelId: json[channelIdEntry] != null
            ? DiscordSnowflake(json[channelIdEntry] as String)
            : null,
        count: json[countEntry] as String?,
        deleteMemberDays: json[deleteMemberDaysEntry] as String?,
        id: json[idEntry] != null
            ? DiscordSnowflake(json[idEntry] as String)
            : null,
        membersRemoved: json[membersRemovedEntry] as String?,
        messageId: json[messageIdEntry] != null
            ? DiscordSnowflake(json[messageIdEntry] as String)
            : null,
        roleName: json[roleNameEntry] as String?,
        type: json[typeEntry] as String?,
      );
}
