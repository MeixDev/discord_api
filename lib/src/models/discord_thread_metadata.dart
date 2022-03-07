class DiscordThreadMetadata {
  /// whether the thread is archived
  final bool archived;

  /// duration in minutes to automatically archive the thread
  /// after recent activity, can be set to: 60, 1440, 4320, 10080
  final int autoArchiveDuration;

  /// timestamp when the thread's archive status was last changed,
  /// used for calculating recent activity
  ///
  /// as an ISO 8601 string
  final String archiveTimestamp;

  late final DateTime? _archiveTimestampAsDateTime;

  /// whether the thread is locked; when a thread is locked,
  /// only users with MANAGE_THREADS can unarchive it
  final bool locked;

  /// whether non-moderators can add other non-moderators
  /// to a thread; only available on private threads
  ///
  /// is not always returned, hence the nullable property
  final bool? invitable;

  /// timestamp when the thread was created; only populated
  /// for threads created after 2022-01-09
  ///
  /// as an ISO 8601 string
  ///
  /// is not always returned, hence the nullable property
  final String? createTimestamp;

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
