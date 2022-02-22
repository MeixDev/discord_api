import 'package:discord_api/src/models/discord_snowflake.dart';

class DiscordThreadMember {
  final DiscordSnowflake? id;
  final DiscordSnowflake? userId;
  final String joinTimestamp;
  late final DateTime? _joinTimestampAsDateTime;
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
        id: json[idEntry] != null ? DiscordSnowflake(json[idEntry]) : null,
        userId: json[userIdEntry] != null
            ? DiscordSnowflake(json[userIdEntry])
            : null,
        joinTimestamp: json[joinTimestampEntry] as String,
        flags: json[flagsEntry] as int,
      );
}
