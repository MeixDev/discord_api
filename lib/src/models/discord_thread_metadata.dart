class DiscordThreadMetadata {
  final bool archived;
  final int autoArchiveDuration; // in minutes, 60 / 1440 / 4320 / 10080
  final String archiveTimestamp;
  late final DateTime? _archiveTimestampAsDateTime;
  final bool locked;
  final bool? invitable;
  final String? createTimestamp; // only populated for threads post 2022-01-09
  late final DateTime? _createTimestampAsDateTime;

  static const archivedEntry = 'archived';
  static const autoArchiveDurationEntry = 'auto_archive_duration';
  static const archiveTimestampEntry = 'archive_timestamp';
  static const lockedEntry = 'locked';
  static const invitableEntry = 'invitable';
  static const createTimestampEntry = 'create_timestamp';

  DiscordThreadMetadata({
    required this.archived,
    required this.autoArchiveDuration,
    required this.archiveTimestamp,
    required this.locked,
    this.invitable,
    this.createTimestamp,
  });

  DateTime? get archiveTimestampAsDateTime {
    _archiveTimestampAsDateTime ??= DateTime.parse(archiveTimestamp);
    return _archiveTimestampAsDateTime;
  }

  DateTime? get createTimestampAsDateTime {
    if (createTimestamp == null) return null;
    _createTimestampAsDateTime ??= DateTime.parse(createTimestamp!);
    return _createTimestampAsDateTime;
  }

  factory DiscordThreadMetadata.fromJson(Map<String, dynamic> json) =>
      DiscordThreadMetadata(
        archived: json[archivedEntry] as bool,
        autoArchiveDuration: json[autoArchiveDurationEntry] as int,
        archiveTimestamp: json[archiveTimestampEntry] as String,
        locked: json[lockedEntry] as bool,
        invitable: json[invitableEntry] as bool?,
        createTimestamp: json[createTimestampEntry] as String?,
      );
}
