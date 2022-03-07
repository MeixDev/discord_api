import 'discord_snowflake.dart';

class DiscordThreadMember {
  /// the id of the thread
  final DiscordSnowflake? id;

  /// the id of the user
  final DiscordSnowflake? userId;

  /// the time the current user last joined the thread
  final String joinTimestamp;

  late final DateTime? _joinTimestampAsDateTime;

  /// any user-thread settings, currently only used for notifications
  final int flags;

  static const idEntry = 'id';
  static const userIdEntry = 'user_id';
  static const joinTimestampEntry = 'join_timestamp';
  static const flagsEntry = 'flags';

  DiscordThreadMember({
    this.id,
    this.userId,
    required this.joinTimestamp,
    required this.flags,
  });

  DateTime? get joinTimestampAsDateTime {
    _joinTimestampAsDateTime ??= DateTime.parse(joinTimestamp);
    return _joinTimestampAsDateTime;
  }

  factory DiscordThreadMember.fromJson(Map<String, dynamic> json) =>
      DiscordThreadMember(
        id: json[idEntry] != null
            ? DiscordSnowflake(json[idEntry] as String)
            : null,
        userId: json[userIdEntry] != null
            ? DiscordSnowflake(json[userIdEntry] as String)
            : null,
        joinTimestamp: json[joinTimestampEntry] as String,
        flags: json[flagsEntry] as int,
      );
}
