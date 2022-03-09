import 'discord_audit_log_change_key.dart';
import 'discord_overwrite.dart';
import 'discord_role.dart';
import 'discord_snowflake.dart';

class DiscordAuditLogChange {
  /// name of the audit log [change key](https://discord.com/developers/docs/resources/audit-log#audit-log-change-object-audit-log-change-key)
  final String key;

  late final DiscordAuditLogChangeKey? _keyAsEnum;
  late final Type? _changeType;

  late final _DiscordAuditLogChange change;

  static const keyEntry = 'key';
  static const newValueEntry = 'new_value';
  static const oldValueEntry = 'old_value';

  DiscordAuditLogChange._(this.key, this.change);

  DiscordAuditLogChangeKey get keyAsEnum =>
      _keyAsEnum ??= discordAuditLogChangeKeyFromValue(key);

  Type get changeType => _changeType ??= keyAsEnum.toType;

  factory DiscordAuditLogChange.fromJson(Map<String, dynamic> json) {
    final key = json[keyEntry] as String;
    final keyAsEnum = discordAuditLogChangeKeyFromValue(key);

    switch (keyAsEnum.toType) {
      case DiscordSnowflake:
        final changeSnowflake = _DiscordAuditLogChange<DiscordSnowflake>(
          newValue: json[newValueEntry] != null
              ? DiscordSnowflake(json[newValueEntry] as String)
              : null,
          oldValue: json[oldValueEntry] != null
              ? DiscordSnowflake(json[oldValueEntry] as String)
              : null,
        );
        return DiscordAuditLogChange._(key, changeSnowflake);
      case int:
        final changeInt = _DiscordAuditLogChange<int>(
          newValue: json[newValueEntry] as int?,
          oldValue: json[oldValueEntry] as int?,
        );
        return DiscordAuditLogChange._(key, changeInt);
      case String:
        final changeString = _DiscordAuditLogChange<String>(
          newValue: json[newValueEntry] as String?,
          oldValue: json[oldValueEntry] as String?,
        );
        return DiscordAuditLogChange._(key, changeString);
      case bool:
        final changeBool = _DiscordAuditLogChange<bool>(
          newValue: json[newValueEntry] as bool?,
          oldValue: json[oldValueEntry] as bool?,
        );
        return DiscordAuditLogChange._(key, changeBool);
      case List<DiscordRole>:
        final changeRole = _DiscordAuditLogChange<List<DiscordRole>>(
          newValue: json[newValueEntry] != null
              ? List<DiscordRole>.from(
                  (json[newValueEntry] as List<dynamic>).map(
                    (e) => DiscordRole.fromJson(e as Map<String, dynamic>),
                  ),
                )
              : null,
          oldValue: json[oldValueEntry] != null
              ? List<DiscordRole>.from(
                  (json[oldValueEntry] as List<dynamic>).map(
                    (e) => DiscordRole.fromJson(e as Map<String, dynamic>),
                  ),
                )
              : null,
        );
        return DiscordAuditLogChange._(key, changeRole);
      case List<DiscordOverwrite>:
        final changePerm = _DiscordAuditLogChange<List<DiscordOverwrite>>(
          newValue: json[newValueEntry] != null
              ? List<DiscordOverwrite>.from(
                  (json[newValueEntry] as List<dynamic>).map(
                    (e) => DiscordOverwrite.fromJson(e as Map<String, dynamic>),
                  ),
                )
              : null,
          oldValue: json[oldValueEntry] != null
              ? List<DiscordOverwrite>.from(
                  (json[oldValueEntry] as List<dynamic>).map(
                    (e) => DiscordOverwrite.fromJson(e as Map<String, dynamic>),
                  ),
                )
              : null,
        );
        return DiscordAuditLogChange._(key, changePerm);
      case Object:
        final changeMixed = _DiscordAuditLogChange<String>(
          newValue: json[newValueEntry]?.toString(),
          oldValue: json[oldValueEntry]?.toString(),
        );
        return DiscordAuditLogChange._(key, changeMixed);
    }
    // default
    final changeInt = _DiscordAuditLogChange<int>(
      newValue: json[newValueEntry] as int?,
      oldValue: json[oldValueEntry] as int?,
    );
    return DiscordAuditLogChange._(key, changeInt);
  }
}

class _DiscordAuditLogChange<T> {
  /// new value of the key
  final T? newValue;

  /// old value of the key
  final T? oldValue;

  _DiscordAuditLogChange({this.newValue, this.oldValue});
}
