class DiscordActivityTimestamps {
  /// unix time (in milliseconds) of when the activity started
  ///
  /// is not always returned, hence the nullable property
  final int? start;

  late final DateTime? _startAsDateTime;

  /// unix time (in milliseconds) of when the activity ends
  ///
  /// is not always returned, hence the nullable property
  final int? end;

  late final DateTime? _endAsDateTime;

  static const startEntry = 'start';
  static const endEntry = 'end';

  DiscordActivityTimestamps({
    this.start,
    this.end,
  });

  DateTime? get startAsDateTime {
    if (start == null) return null;
    _startAsDateTime ??= DateTime.fromMillisecondsSinceEpoch(start!);
    return _startAsDateTime;
  }

  DateTime? get endAsDateTime {
    if (end == null) return null;
    _endAsDateTime ??= DateTime.fromMillisecondsSinceEpoch(end!);
    return _endAsDateTime;
  }

  factory DiscordActivityTimestamps.fromJson(Map<String, dynamic> json) =>
      DiscordActivityTimestamps(
        start: json['start'] as int?,
        end: json['end'] as int?,
      );
}
