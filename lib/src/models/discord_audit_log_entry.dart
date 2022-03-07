import 'discord_audit_log_change.dart';
import 'discord_audit_log_event.dart';
import 'discord_optional_audit_entry_info.dart';
import 'discord_snowflake.dart';

class DiscordAuditLogEntry {
  /// id of the affected entity (webhook, user, role, etc.)
  ///
  /// is always returned, but can be null
  final String? targetId;

  /// changes made to the target_it
  ///
  /// is not always returned, hence the nullable property
  final List<DiscordAuditLogChange>? changes;

  /// the user who made the changes
  ///
  /// is always returned, but can be null
  final DiscordSnowflake? userId;

  /// id of the entry
  final DiscordSnowflake id;

  /// type of action that occured
  final int actionType;

  late final DiscordAuditLogEvent? _actionTypeAsEnum;

  /// additional info for certain action types
  ///
  /// is not always returned, hence the nullable property
  final DiscordOptionalAuditEntryInfo? options;

  /// the reason for the change (0-512 characters)
  ///
  /// is not always returned, hence the nullable property
  final String? reason;

  static const targetIdEntry = "target_id";
  static const changesEntry = "changes";
  static const userIdEntry = "user_id";
  static const idEntry = "id";
  static const actionTypeEntry = "action_type";
  static const optionsEntry = "options";
  static const reasonEntry = "reason";

  DiscordAuditLogEntry({
    this.targetId,
    this.changes,
    this.userId,
    required this.id,
    required this.actionType,
    this.options,
    this.reason,
  });

  DiscordAuditLogEvent get actionTypeAsEnum =>
      _actionTypeAsEnum ??= discordAuditLogEventFromValue(actionType);

  factory DiscordAuditLogEntry.fromJson(Map<String, dynamic> json) =>
      DiscordAuditLogEntry(
        targetId: json[targetIdEntry] as String?,
        changes: json[changesEntry] != null
            ? List<DiscordAuditLogChange>.from(
                (json[changesEntry] as List<dynamic>).map(
                  (x) =>
                      DiscordAuditLogChange.fromJson(x as Map<String, dynamic>),
                ),
              )
            : null,
        userId: json[userIdEntry] != null
            ? DiscordSnowflake(json[userIdEntry] as String)
            : null,
        id: DiscordSnowflake(json[idEntry] as String),
        actionType: json[actionTypeEntry] as int,
        options: json[optionsEntry] != null
            ? DiscordOptionalAuditEntryInfo.fromJson(
                json[optionsEntry] as Map<String, dynamic>,
              )
            : null,
        reason: json[reasonEntry] as String?,
      );
}
